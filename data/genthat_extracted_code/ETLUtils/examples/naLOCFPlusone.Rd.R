library(ETLUtils)


### Name: naLOCFPlusone
### Title: Performs NA replacement by last observation carried forward but
###   adds 1 to the last observation carried forward.
### Aliases: naLOCFPlusone

### ** Examples

require(zoo)
x <- c(2,NA,NA,4,5,2,NA)
naLOCFPlusone(x)



