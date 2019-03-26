library(spatstat.utils)


### Name: check.anyvector
### Title: Check For Vector or Factor With Correct Length
### Aliases: check.anyvector
### Keywords: error utilities

### ** Examples

   z <- factor(1:10)
   check.anyvector(z, 5, fatal=FALSE)
   y <- z[1]
   check.anyvector(y, 5, oneok=TRUE)



