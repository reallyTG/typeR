library(adapr)


### Name: Read
### Title: Read data and capture the file information within dependency
###   object
### Aliases: Read

### ** Examples

## Not run: 
##D source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D write.csv(cars,file.path(source_info$data.dir,"test.csv"))
##D cardata <- Read("test.csv","cars dataframe",as.is=TRUE)
##D file.remove(file.path(source_info$data.dir,"test.csv"))
## End(Not run)  




