library(adapr)


### Name: Write.cap
### Title: Lower level function that writes data and captures the file
###   information within dependency object
### Aliases: Write.cap

### ** Examples

## Not run: 
##D source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D testfile <- file.path(source_info$results.dir,"test.csv")
##D fileinfo <- createFileInfo(dirname(testfile),basename(testfile),"cars dataset")
##D Write.cap(cars,fileinfo,write.csv,source_info,row.names=FALSE)
## End(Not run) 



