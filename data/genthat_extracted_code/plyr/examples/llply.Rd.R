library(plyr)


### Name: llply
### Title: Split list, apply function, and return results in a list.
### Aliases: llply
### Keywords: manip

### ** Examples

llply(llply(mtcars, round), table)
llply(baseball, summary)
# Examples from ?lapply
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))

llply(x, mean)
llply(x, quantile, probs = 1:3/4)



