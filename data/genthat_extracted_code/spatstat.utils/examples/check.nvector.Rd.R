library(spatstat.utils)


### Name: check.nvector
### Title: Check For Numeric Vector With Correct Length
### Aliases: check.nvector
### Keywords: error utilities

### ** Examples

   z <- 1:10
   check.nvector(z, 5, fatal=FALSE)
   y <- 42
   check.nvector(y, 5, fatal=FALSE, oneok=TRUE)



