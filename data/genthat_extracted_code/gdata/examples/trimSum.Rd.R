library(gdata)


### Name: trimSum
### Title: Trim a vector such that the last/first value represents the sum
###   of trimmed values
### Aliases: trimSum
### Keywords: manip

### ** Examples


x <- 1:10
trimSum(x, n=5)
trimSum(x, n=5, right=FALSE)

x[9] <- NA
trimSum(x, n=5)
trimSum(x, n=5, na.rm=TRUE)




