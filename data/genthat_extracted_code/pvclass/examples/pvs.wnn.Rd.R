library(pvclass)


### Name: pvs.wnn
### Title: P-Values to Classify New Observations (Weighted Nearest
###   Neighbors)
### Aliases: pvs.wnn
### Keywords: classif

### ** Examples

X <- iris[c(1:49, 51:99, 101:149), 1:4]
Y <- iris[c(1:49, 51:99, 101:149), 5]
NewX <- iris[c(50, 100, 150), 1:4]

pvs.wnn(NewX, X, Y, wtype = 'l', tau = 0.5)



