library(readbulk)


### Name: read_opensesame
### Title: Read and combine raw OpenSesame data.
### Aliases: read_opensesame

### ** Examples

## Not run: 
##D # Read single raw data file from OpenSesame
##D raw_data <- utils::read.csv("raw_data/subject-1.csv",encoding = "UTF-8")
##D 
##D # Merge all files in the main folder "raw_data"
##D # (which is in the current working directory)
##D raw_data <- read_opensesame(directory = "raw_data")
##D 
##D # Merge files with file extension ".csv"
##D raw_data <- read_opensesame(directory = "raw_data",
##D   extension = ".csv")
##D 
##D # Merge all files stored in separate folders
##D # within the folder "raw_data"
##D raw_data <- read_opensesame(directory = "raw_data",
##D   subdirectories = TRUE)
##D 
##D # Merge all raw data stored in the folders "Session1"
##D # and "Session2" within the folder "raw_data"
##D raw_data <- read_opensesame(directory = "raw_data",
##D   subdirectories = c("Session1","Session2"))
##D 
##D # Export merged data to a file using write.table
##D write.table(raw_data, file = "raw_data.csv",
##D   sep=",", row.names = FALSE)
## End(Not run)



