library(glmnetcr)


### Name: cr.backward
### Title: Backward Continuation Ratio Restructure Function
### Aliases: cr.backward
### Keywords: internal

### ** Examples

data(diabetes)
x <- diabetes[,2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmnetcr(x, y, method = "backward")



