library(HelpersMG)


### Name: read_folder
### Title: Read files present in a folder and creates a list with the
###   content of these files
### Aliases: read_folder

### ** Examples

## Not run: 
##D library(HelpersMG)
##D # Read all the .csv files from the current folder/directory
##D contentaslist <- read_folder(folder=".", wildcard="*.csv", read=read.csv2)
##D # Read all the files from the current folder/directory
##D contentaslist <- read_folder(folder=".", wildcard="*.*", read=read.csv2)
##D # Read two files from the current folder/directory
##D files <- c("filename1.csv", "filename2.csv")
##D contentaslist <- read_folder(folder=".", wildcard=files, read=read.csv2)
## End(Not run)



