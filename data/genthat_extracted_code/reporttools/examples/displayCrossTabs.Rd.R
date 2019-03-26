library(reporttools)


### Name: displayCrossTabs
### Title: Function to display a set of K x C frequency tables, including
###   p-value
### Aliases: displayCrossTabs
### Keywords: manip character

### ** Examples

set.seed(1977)
v0 <- round(runif(20, 0, 5))
v1 <- round(runif(20, 0, 3))
v2 <- round(runif(20, 0, 4))
displayCrossTabs(vars = data.frame(v1, v2), v0, nam0 = "v0", lab0 = "Q1") 



