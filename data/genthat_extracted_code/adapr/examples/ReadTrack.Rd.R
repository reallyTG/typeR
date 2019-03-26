library(adapr)


### Name: ReadTrack
### Title: Tracks files that read by functions not in adapr and captures
###   the file information within dependency object
### Aliases: ReadTrack

### ** Examples

## Not run: 
##D  source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D write.csv(cars,file.path(source_info$data.dir,"test.csv"))
##D # Read with any function
##D temp <- utils::read.csv(file.path(source_info$data.dir,"test.csv"))
##D ReadTrack("test.csv","cars dataframe")
##D # Will track the file as though read with Read().
##D file.remove(file.path(source_info$data.dir,"test.csv"))
## End(Not run) 



