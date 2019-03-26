library(meaRtools)


### Name: read_spikelist
### Title: Axion convert spk_list to r_object
### Aliases: read_spikelist
### Keywords: spike_list r_object Axion

### ** Examples

## No test: 
temp_path=tempdir()
master_chem_file<-paste0( temp_path,"/data",
   "/exampleRecording_1012016_plate1_expLog.csv" )
      
spike_list_file<-paste0( temp_path,"/data",
"/exampleRecording_1012016_plate1_DIV1_spike_list.csv" )

title<-strsplit(basename(spike_list_file), ".csv")[[1]][1]
# get plate chemical info for each file in the list

plate_chem_info<-chem_info_2( file=spike_list_file, master_chem_file = master_chem_file )

r_object_file_name<-read_spikelist(key=title, 
                  spk_list_file=plate_chem_info, 
                  chem_info=plate_chem_info,r_object_dir="/") 
## End(No test)



