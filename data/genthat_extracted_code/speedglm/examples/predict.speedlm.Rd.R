library(speedglm)


### Name: predict.speedlm
### Title: Predict method for a speedlm object
### Aliases: predict.speedlm
### Keywords: models

### ** Examples

set.seed(10)
x <- round( matrix(rnorm(20*3),20,3),digits=3)
colnames(x) <-c("y","s1","s2")
da <- as.data.frame(x)
mod <- speedlm(y~s1+s2, data=da, fitted=TRUE)
predict(mod)




