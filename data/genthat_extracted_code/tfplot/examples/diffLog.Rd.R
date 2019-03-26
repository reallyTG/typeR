library(tfplot)


### Name: diffLog
### Title: Calculate the difference of log data
### Aliases: diffLog diffLog.default
### Keywords: ts

### ** Examples

z <- matrix(100 + rnorm(200),100,2)
z[z <= 0] <- 1 # not to likely, but it can happen
z <- diffLog(z)



