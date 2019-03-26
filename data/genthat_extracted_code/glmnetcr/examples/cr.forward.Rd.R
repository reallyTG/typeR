library(glmnetcr)


### Name: cr.forward
### Title: Forward Continuation Ratio Restructure Function
### Aliases: cr.forward
### Keywords: internal

### ** Examples

data(diabetes)
x <- diabetes[,2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmnetcr(x, y, method = "forward")



