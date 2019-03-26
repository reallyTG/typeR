library(liureg)


### Name: residuals.liu
### Title: Liu Regression Residuals
### Aliases: residuals.liu residuals
### Keywords: Liu Residuals

### ** Examples

mod<-liu(y~., data = as.data.frame(Hald), d = seq(-2, 2, 0.1))

residuals(mod)



