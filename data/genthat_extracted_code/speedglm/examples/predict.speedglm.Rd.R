library(speedglm)


### Name: predict.speedglm
### Title: Predict method for a speedglm object
### Aliases: predict.speedglm
### Keywords: models

### ** Examples

set.seed(10)
y <- rgamma(20,1.5,1)
x <-round( matrix(rnorm(20*2),20,2),digits=3)
colnames(x) <-c("s1","s2")
da <- data.frame(y,x)
mod <- speedglm(y~s1+s2, data=da, family=Gamma(log), fitted=TRUE)
predict(mod)




