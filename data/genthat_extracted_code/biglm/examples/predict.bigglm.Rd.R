library(biglm)


### Name: predict.bigglm
### Title: Predictions from a biglm/bigglm
### Aliases: predict.bigglm predict.biglm
### Keywords: regression

### ** Examples

example(biglm)
predict(a,newdata=trees)
f<-predict(a,make.function=TRUE)
X<- with(trees, cbind(log(Girth),log(Height)))
f(X)



