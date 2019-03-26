library(AdaptFitOS)


### Name: predict.asp
### Title: Semiparametric regression prediction.
### Aliases: predict.asp
### Keywords: models smooth regression

### ** Examples

data(fossil,package="SemiPar")
attach(fossil)
fit <- asp2(strontium.ratio~f(age, basis="tps"))
newdata.age <- data.frame(age=c(90,100,110,120,130))
preds <-  predict(fit,newdata=newdata.age,se=TRUE)
print(preds)

# Use predict to avoid centering of smooths in case of scatterplot 
# smoothing
  fit <- asp2(strontium.ratio~f(age,basis="tps"))
  newdata.age <-data.frame(age=seq(90,130,length.out=50) )
  preds <- predict(fit,newdata=newdata.age,se=TRUE)
  plot(age,strontium.ratio)
  lines(newdata.age$age,preds$fit,col="red")
  lines(unlist(newdata.age),preds$fit+2*preds$se,col="blue")
  lines(unlist(newdata.age),preds$fit-2*preds$se,col="green")



