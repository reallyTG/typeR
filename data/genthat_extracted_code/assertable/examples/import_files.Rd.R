library(assertable)


### Name: import_files
### Title: Given a vector of filenames, append all files and return as one
###   data.table using a user-defined function
### Aliases: import_files

### ** Examples

## Not run: 
##D  for(i in 1:3) {
##D    data <- CO2
##D    data$id_var <- i
##D    write.csv(data,file=paste0("file_",i,".csv"),row.names=FALSE)
##D  }
##D  filenames <- paste0("file_",c(1:3),".csv")
##D  import_files(filenames, FUN=fread)
##D  import_files(filenames, FUN=read.csv, stringsAsFactors=FALSE)
##D  import_files(filenames, FUN=fread, multicore=T, mc.cores=1) # Only if you have a multi-core system
## End(Not run)



