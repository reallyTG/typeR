library(gMCP)


### Name: sampSizeCore
### Title: Function for sample size calculation
### Aliases: sampSizeCore

### ** Examples


f <- function(x){1/100*log(x)}
gMCP:::sampSizeCore(upperN=1000, targFunc=f, target=0.008, verbose=TRUE, alRatio=1)




