library(adapr)


### Name: WriteTrack
### Title: Tracks files written by functions not in adapr and captures the
###   file information within dependency object
### Aliases: WriteTrack

### ** Examples

## Not run: 
##D source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D write.csv(cars,file.path(source_info$results.dir,"test.csv"))
##D WriteTrack("cars.csv","cars dataframe")
##D showResults()  
## End(Not run) 
 



