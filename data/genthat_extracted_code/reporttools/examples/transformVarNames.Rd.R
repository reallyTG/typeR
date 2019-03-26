library(reporttools)


### Name: transformVarNames
### Title: Generate R-code assigning each variable in a data frame to its
###   name
### Aliases: transformVarNames
### Keywords: manip character

### ** Examples

labpar1 <- rnorm(50)
labor.param2 <- rgamma(50, 2, 1)
dat <- data.frame(labpar1, labor.param2)
transformVarNames(dat, name = "dat")



