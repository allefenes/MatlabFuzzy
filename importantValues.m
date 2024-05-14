clear all; close all; clc;
load('fuzzyResults.mat', 'fuzzy')
load('pid.mat', 'pid')

plot(pid(1, :), pid(2, :),'LineWidth',2,'DisplayName','PID');
hold on;
plot(fuzzy(1,:), fuzzy(2,:),'LineWidth',2,'DisplayName','PD-FUZZY');

legend();
title('System Behaviors', 'FontSize', 14, 'FontWeight', 'bold');

grid on;

disp('Fuzzy Results');

time = fuzzy(1,:);
values = fuzzy(2,:);

targetvalue = 180;

%Overshoot

targetvalue = 180;

peak_value = max(values);

if peak_value > targetvalue
    overshoot = (peak_value - targetvalue) / targetvalue * 100;
    disp(['Overshoot: ', num2str(overshoot), '%']);
else
    disp(['Overshoot: ', '0', '%']);
end

%rise time

[riseTime, riseLoc] = risetime(values, fuzzy(1,:));
disp(['Rise Time: ' num2str(riseTime), 'sn.']);    


% SettlingTime
info = stepinfo(values,time);
disp(['Settling Time: ', num2str(info.TransientTime), 'sn.']);


%SteadyState Error

err = abs(targetvalue-values(800));
per = err * 100 / targetvalue;
disp(['SS Error: ', num2str(per), '%']);






disp('---------------------');
disp('PID Results');

time = pid(1,:);
values = pid(2,:);

targetvalue = 180;

%Overshoot

targetvalue = 180;

peak_value = max(values);

if peak_value > targetvalue
    overshoot = (peak_value - targetvalue) / targetvalue * 100;
    disp(['Overshoot: ', num2str(overshoot), '%']);
else
    disp(['Overshoot: ', '0', '%']);
end

%rise time

[riseTime, riseLoc] = risetime(values, fuzzy(1,:));
disp(['Rise Time: ' num2str(riseTime), 'sn.']);    


% SettlingTime
info = stepinfo(values,time);
disp(['Settling Time: ', num2str(info.TransientTime), 'sn.']);


%SteadyState Error

err = abs(targetvalue-values(800));
per = err * 100 / targetvalue;
disp(['SS Error: ', num2str(per), '%']);

