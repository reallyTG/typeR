library(plyr)


### Name: mdply
### Title: Call function with arguments in array or data frame, returning a
###   data frame.
### Aliases: mdply
### Keywords: manip

### ** Examples

mdply(data.frame(mean = 1:5, sd = 1:5), rnorm, n = 2)
mdply(expand.grid(mean = 1:5, sd = 1:5), rnorm, n = 2)
mdply(cbind(mean = 1:5, sd = 1:5), rnorm, n = 5)
mdply(cbind(mean = 1:5, sd = 1:5), as.data.frame(rnorm), n = 5)



