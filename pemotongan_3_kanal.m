clear;
clc;

for i = 1:9
    nama = sprintf('A0%dT.gdf', i);
    namafile{i,1} = nama;
end

for m = 1:9
    [s,h] = sload(namafile{m});
    raw_sinyal{m,1} = s;
    data_struct{m,1} = h;
end

for j= 1:9
    tipe{j,1} = data_struct{j,1}.EVENT.TYP;
    durasi{j,1} = data_struct{j,1}.EVENT.DUR;
    posisi{j,1} = data_struct{j,1}.EVENT.POS;
end

fs = data_struct{1,1}.SampleRate;

for m = 1:25
	for i = 1:9
		channel{m,i} = raw_sinyal{i,1}(:,m);
	end
end


%% listing untuk cut setiap channel
for i = 1:9
    data_channel{1,i} = channel{8,i};
    data_channel{2,i} = channel{10,i};
    data_channel{3,i} = channel{12,i};
end

%% potong data setiap class
for i = 1:9                                     % variabel subjek
	for j = 1:length(tipe{i,1})                 % variabel panjang data                         

	pos{i,1} = posisi{i,1};
	dur{i,1} = durasi{i,1};
	index_class1{i,1} = find(tipe{i,1} == 769);
	index_class2{i,1} = find(tipe{i,1} == 770);
	index_class3{i,1} = find(tipe{i,1} == 771);
	index_class4{i,1} = find(tipe{i,1} == 772);
	
		if (tipe{i,1}(j,1) == 769)
		class1C3{j,i} = data{1,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 1 (C8)	-- sinyal 8
		class1C4{j,i} = data{2,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 2 (C10)	-- sinyal 10
		class1Cz{j,i} = data{3,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 3 (Cz) 	-- sinyal 12

		elseif (tipe{i,1}(j,1) == 770)
		class2C3{j,i} = data{1,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 1 (C8)	-- sinyal 8
		class2C4{j,i} = data{2,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 2 (C10)	-- sinyal 10
		class2Cz{j,i} = data{3,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 3 (Cz) 	-- sinyal 12
		
		elseif (tipe{i,1}(j,1) == 771)
		class3C3{j,i} = data{1,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 1 (C8)	-- sinyal 8
		class3C4{j,i} = data{2,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 2 (C10)	-- sinyal 10
		class3Cz{j,i} = data{3,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+dur{i,1}(j,1)+1000)); % event di channel 3 (Cz) 	-- sinyal 12
		
		elseif (tipe{i,1}(j,1) == 772)
		class4C3{j,i} = data{1,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+1000)); % event di channel 1 (C8)	-- sinyal 8
		class4C4{j,i} = data{2,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+1000)); % event di channel 2 (C10)	-- sinyal 10
		class4Cz{j,i} = data{3,i}((pos{i,1}(j,1))+251:(pos{i,1}(j,1)+1000)); % event di channel 3 (Cz) 	-- sinyal 12
        end
	end
    
class1{1,1} = class1C3;
class1{2,1} = class1C4;
class1{3,1} = class1Cz;
class2{1,1} = class2C3;
class2{2,1} = class2C4;
class2{3,1} = class2Cz;
class3{1,1} = class3C3;
class3{2,1} = class3C4;
class3{3,1} = class3Cz;
class4{1,1} = class4C3;
class4{2,1} = class4C4;
class4{3,1} = class4Cz;

end