library(RFLPtools)


### Name: read.rflp
### Title: Read RFLP data
### Aliases: read.rflp
### Keywords: file connection

### ** Examples

Dir <- system.file("extdata", package = "RFLPtools") # input directory 
filename <- file.path(Dir, "RFLPexample.txt")
RFLP1 <- read.rflp(file = filename)
str(RFLP1)

filename <- file.path(Dir, "AZ091016_report.txt")
RFLP2 <- read.rflp(file = filename)
str(RFLP2)



