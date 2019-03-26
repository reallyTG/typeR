library(meaRtools)


### Name: get_experimental_log_file
### Title: get_experimental_log_file
### Aliases: get_experimental_log_file
### Keywords: experimental log

### ** Examples

## No test: 
temp_path=tempdir()
master_chem_file<-paste0( temp_path,"/data",
   "/exampleRecording_1012016_plate1_expLog.csv" )
      
spike_list_file<-paste0( temp_path,"/data",
"/exampleRecording_1012016_plate1_DIV1_spike_list.csv" )

plate.data<-getxperimental.log.file( file=spike.list.file, master_chem_file = master_chem_file )
## End(No test)



