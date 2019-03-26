library(pvclass)


### Name: pvs
### Title: P-Values to Classify New Observations
### Aliases: pvs
### Keywords: classif

### ** Examples

X <- iris[c(1:49, 51:99, 101:149), 1:4]
Y <- iris[c(1:49, 51:99, 101:149), 5]
NewX <- iris[c(50, 100, 150), 1:4]

pvs(NewX, X, Y, method = 'k', k = 10)



