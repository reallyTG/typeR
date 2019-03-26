library(adapr)


### Name: Read.cap
### Title: Lower level function that reads data and capture the file
###   information within dependency object
### Aliases: Read.cap

### ** Examples

## Not run: 
##D source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D testfile <- file.path(source_info$data.dir,"test.csv")
##D write.csv(cars,testfile)
##D fileinfo <- createFileInfo(dirname(testfile),basename(testfile),"cars dataset")
##D Read.cap(fileinfo,read.csv,source_info)
##D file.remove(file.path(source_info$data.dir,"test.csv"))
##D 
## End(Not run) 



