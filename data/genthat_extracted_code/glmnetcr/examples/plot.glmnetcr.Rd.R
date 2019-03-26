library(glmnetcr)


### Name: plot.glmnetcr
### Title: Plots the Regularization Path Computed from glmnet.cr
### Aliases: plot.glmnetcr
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(glmnetcr)
data(diabetes)
x<-diabetes[,2:dim(diabetes)[2]]
y<-diabetes$y
summary(y)
fit<-glmnetcr(x,y)
plot(fit)
plot(fit,xvar="step",type="bic")



