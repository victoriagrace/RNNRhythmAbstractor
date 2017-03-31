%% Remapping layered offset, two sequence output from Simple RNN

close all
counter_out = [0.32866901, 0.32866901, 0.66720903, 0.66720903, 0.99986005, 0.99986005, -0.00031048898, -0.00031048898, 0.33319435, 0.33319435, 0.66664463, 0.66664463, 1.0000049, 1.0000049, -0.00015495997, -0.00015495997, 0.33282998, 0.33282998, 0.66661137, 0.66661137, 1.0000105, 1.0000105, -0.00025251228, -0.00025251228, 0.33295646, 0.33295646, 0.66692603, 0.66692603, 0.99955314, 0.99955314, -0.00046112854, -0.00046112854, 0.33348572, 0.33348572, 0.6659115, 0.66688651, 0.99899411, 0.99943656, -0.00024036784, 0.00010239612, 0.33339611, 0.33258864, 0.66648805, 0.66631532, 0.99959946, 0.99941421, -0.0002376372, -0.00040776189, 0.33255783, 0.33321157, 0.66576368, 0.6664592, 0.99941003, 0.99910438, 2.3720786e-06, -0.0001119161, 0.33305541, 0.33271343, 0.66680276, 0.66698653, 0.99959469, 0.99986303, -5.8715232e-05, -0.00077435747, 0.33271974, 0.33290306, 0.66645908, 0.66669238, 0.99950689, 0.99983108, 7.6059252e-05, 5.6461431e-05, 0.33280635, 0.33257437, 0.66669524, 0.66612196, 0.99991494, 0.99908757, -0.0005638767, 0.0001101559, 0.33293894, 0.33310285, 0.66572791, 0.666255, 0.99909258, 0.99912024, -0.00057845656, -9.3945302e-05, 0.33241814, 0.33283162, 0.66635197, 0.66626549, 0.99941337, 0.99975848, -0.00098052621, -0.00023149792, 0.33366063, 0.33312854, 0.66595882, 0.66611469, 0.99976075, 1.0000412, 0.00014843326, 0.00032427814, 0.33290616, 0.33295992, 0.6663183, 0.66649359, 0.99936533, 1.0001658, 0.00042521488, 6.4812601e-05, 0.33311051, 0.33333755, 0.66677743, 0.66628027, 1.0001804, 0.99959838, -6.4396299e-05, -0.00022255257, 0.3331466, 0.33295569, 0.66646373, 0.66665536, 0.99966937, 0.99970526, -0.00045191962, -0.00020198803, 0.33262956, 0.33283117, 0.66592652, 0.66599178, 0.99888724, 0.99977076, -0.00014676992, -3.068056e-05, 0.33296818, 0.33254465, 0.66648805, 0.66644323, 1.0003595, 1.0002586, -0.00095808785, -8.8547356e-05, 0.3341049, 0.33314127, 0.66598535, 0.66630512, 0.99996674, 0.99987906, 0.00045948755, -1.4165416e-06, 0.33313179, 0.3325918, 0.66674232, 0.66651428, 0.99977839, 0.99956918, 0.00026091654, -2.875831e-05];
counter_orig = [0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0, 0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1, 0,0.3333,0.6667, 1,0,0.3333,0.6667, 1]
counter_orig1 = counter_orig(1:end/2);
counter_orig2 = counter_orig(end/2+1:end);

output = zeros(1,length(counter_orig));
seq_ind = (1:length(counter_out))
newout1 = [];

% Here we remap the target sequence to match the output sequence
for R = 1:length(seq_ind)/2
    ind = R*2
%     counter_orig(R)
   output(ind) = counter_orig(R)
end 
for R = 1:length(seq_ind)/2
    ind = R*2-1
%     counter_orig(R)
   output(ind) = counter_orig(R)
end 
subplot(2,1,1)
bar(output)

subplot(2,1,2)
bar(counter_out)
