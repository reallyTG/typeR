library(meaRtools)


### Name: write_plate_summary_for_bursts
### Title: Prints bursting features
### Aliases: write_plate_summary_for_bursts
### Keywords: bursts IBI duration frequency

### ** Examples

data("S")  
output_dir = file.path(tempdir(),"Analysis")
print(paste0("Creating output folders under ",output_dir))
dir.create(output_dir)

s<-list(); s[[1]]<-S
write_plate_summary_for_bursts(s, output_dir)



