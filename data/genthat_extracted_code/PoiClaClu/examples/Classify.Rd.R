library(PoiClaClu)


### Name: Classify
### Title: Classify observations using a Poisson model.
### Aliases: Classify

### ** Examples

set.seed(1)
dat <- CountDataSet(n=40,p=500,sdsignal=.1,K=3,param=10)
cv.out <- Classify.cv(dat$x,dat$y)
print(cv.out)
out <- Classify(dat$x,dat$y,dat$xte,rho=cv.out$bestrho)
print(out)
cat("Confusion matrix for predicted and true test class labels:", fill=TRUE)
print(table(out$ytehat,dat$yte))



