library(filesstrings)


### Name: nice_file_nums
### Title: Make file numbers comply with alphabetical order
### Aliases: nice_file_nums

### ** Examples

## Not run: 
##D dir.create("NiceFileNums_test")
##D setwd("NiceFileNums_test")
##D files <- c("1litres_1.txt", "1litres_30.txt", "3litres_5.txt")
##D file.create(files)
##D nice_file_nums()
##D nice_file_nums(pattern = "\\.txt$")
##D setwd("..")
##D dir.remove("NiceFileNums_test")
## End(Not run)



