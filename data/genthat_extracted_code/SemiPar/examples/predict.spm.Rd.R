library(SemiPar)


### Name: predict.spm
### Title: Semiparametric regression prediction.
### Aliases: predict.spm
### Keywords: models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
newdata.age <- data.frame(age=c(90,100,110,120,130))
preds <-  predict(fit,newdata=newdata.age,se=TRUE)
print(preds)

plot(fit,xlim=c(90,130))
points(unlist(newdata.age),preds$fit,col="red")
points(unlist(newdata.age),preds$fit+2*preds$se,col="blue")
points(unlist(newdata.age),preds$fit-2*preds$se,col="green")



