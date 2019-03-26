library(RFLPtools)


### Name: read.blast
### Title: Read BLAST data
### Aliases: read.blast
### Keywords: file connection

### ** Examples

Dir <- system.file("extdata", package = "RFLPtools") # input directory 
filename <- file.path(Dir, "BLASTexample.txt")
BLAST1 <- read.blast(file = filename)
str(BLAST1)



