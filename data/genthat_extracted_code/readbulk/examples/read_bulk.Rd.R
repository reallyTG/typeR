library(readbulk)


### Name: read_bulk
### Title: Read and combine multiple data files.
### Aliases: read_bulk

### ** Examples

## Not run: 
##D # Merge all files in the main folder "raw_data"
##D # (which is in the current working directory)
##D raw_data <- read_bulk(directory = "raw_data")
##D 
##D # Merge files with file extension ".csv"
##D raw_data <- read_bulk(directory = "raw_data",
##D   extension = ".csv")
##D 
##D # Merge all files stored in separate folders
##D # within the folder "raw_data"
##D raw_data <- read_bulk(directory = "raw_data",
##D   subdirectories = TRUE)
##D 
##D # Merge all raw data stored in the folders "Session1"
##D # and "Session2" within the folder "raw_data"
##D raw_data <- read_bulk(directory = "raw_data",
##D   subdirectories = c("Session1","Session2"))
##D 
##D # Merge tab separated data files and prevent
##D # character vectors from being converted to factors
##D raw_data <- read_bulk(directory = "raw_data",
##D   fun=read.delim,stringsAsFactor=FALSE)
## End(Not run)



