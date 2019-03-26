library(sclero)


### Name: read.ijdata
### Title: Read ImageJ zip file containing several ROI files and extract
###   coordinate information.
### Aliases: read.ijdata

### ** Examples

# Locate the example zip file
path <- file.path(system.file("extdata", package = "sclero"), "shellspots.zip") 

# You can replace 'path' by 'Your_file_name.zip'
dat <- read.ijdata(path) 
summary(dat)

## Works also for IJZIP objects
dat2 <- read.ijzip(path)
dat2 <- read.ijdata(dat2)
dat[!(dat %in% dat2)] # Only the sample name differs



