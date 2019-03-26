library(PoiClaClu)


### Name: Classify.cv
### Title: Function to do cross-validation for Poisson classification.
### Aliases: Classify.cv

### ** Examples

set.seed(1)
dat <- CountDataSet(n=40,p=500,sdsignal=.1,K=3,param=10)
cv.out <- Classify.cv(dat$x,dat$y)
print(cv.out)
out <- Classify(dat$x,dat$y,dat$xte,rho=cv.out$bestrho)
print(out)
cat("Confusion matrix comparing predicted class labels to true class
labels for training observations:", fill=TRUE)
print(table(out$ytehat,dat$yte))



