library(glmnetcr)


### Name: print.glmnetcr
### Title: Print a glmnetcr Object
### Aliases: print.glmnetcr
### Keywords: methods

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
print(glmnet.fit)



