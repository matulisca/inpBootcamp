% clears the existing variables in the workspace - probably not a good idea
% to do often!
clear;

% will load as variable cellResps, because I gave it that name when I
% saved the data
load('sampleData.mat');

%% adding some comments
%% plot the data from the first cell
firstCellData = cellResps(:, 1);

% firstCellData is a 1920 x 1 vector (1920 time points, 1 cell)
size(firstCellData)
figure;plot(firstCellData);

% plot the first half of the data
% subtract 1 so we can see the two data sets
hold on;plot(firstCellData(1:length(firstCellData)/2)-1);

%% plot the data from all the cells
figure;plot(cellResps);

%% plot the data from cells 1, 2, 4
for i = [1 2 4]
   figure;plot(cellResps(:, i)); 
end

%% plot the data in the same figure
figure;
for i = [1 2 4]
   hold on;
   plot(cellResps(:, i)); 
end

%% label the data
figure;
legendLabels = cell(3, 1);
j = 1;
for i = [1 2 4]
   hold on;
   plot(cellResps(:, i));
   legendLabels{j} = ['Cell ' num2str(j)];
   j = j+1;
end
legend(legendLabels);
xlabel('Time');
ylabel('Response');

%% call a function on the data
dataMean = mean(cellResps, 'omitnan');
% This mean gives 4 values - must be the mean of each column. But what if
% we want the mean trace (mean of 4 cells over all 1920 values)?

dataMean = mean(cellResps, 2, 'omitnan');
% Now we have a 1920 x 1 vector
figure;plot(dataMean);