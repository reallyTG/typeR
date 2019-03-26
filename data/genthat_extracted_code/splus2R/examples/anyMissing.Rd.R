library(splus2R)


### Name: anyMissing
### Title: Returns TRUE if missing values are round, otherwise FALSE
### Aliases: anyMissing
### Keywords: utilities

### ** Examples

anyMissing(1:5)
anyMissing(c(1, NA, 2))
anyMissing(list(a=1:3, b=NA))
anyMissing(data.frame(a=1:3, b=c(NA, 5:6)))



