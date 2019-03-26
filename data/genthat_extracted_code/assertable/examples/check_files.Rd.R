library(assertable)


### Name: check_files
### Title: Check for the existence of a vector of files, optionally
###   repeated for a set amount of time.
### Aliases: check_files

### ** Examples

## Not run: 
##D  for(i in 1:3) {
##D    data <- CO2
##D    data$id_var <- i
##D    write.csv(data,file=paste0("file_",i,".csv"),row.names=FALSE)
##D  }
##D  filenames <- paste0("file_",c(1:3),".csv")
##D  check_files(filenames)
## End(Not run)



