library(adapr)


### Name: Write
### Title: Write object and capture file information
### Aliases: Write

### ** Examples

## Not run: 
##D # Within an R script:
##D source_info <- create_source_file_dir("adaprHome","tree_controller.R")
##D # Inside R script body:
##D write.csv(cars,file.path(source_info$results.dir,"test.csv"))
##D Write(cars,"cars.csv","cars dataframe")
##D # To examine effect:
##D showResults()  
## End(Not run) 




