library(pec)


### Name: plotPredictSurvProb
### Title: Plotting predicted survival curves.
### Aliases: plotPredictSurvProb
### Keywords: survival

### ** Examples


# generate some survival data
library(prodlim)
d <- SimSurv(100)
# then fit a Cox model 
library(rms)
coxmodel <- cph(Surv(time,status)~X1+X2,data=d,surv=TRUE)
# plot predicted survival probabilities for all time points
ttt <- sort(unique(d$time))
# and for selected predictor values:
 ndat <- data.frame(X1=c(0.25,0.25,-0.05,0.05),X2=c(0,1,0,1))
plotPredictSurvProb(coxmodel,newdata=ndat,times=ttt)

# the same can be done e.g. for a randomSurvivalForest model
library(randomForestSRC)
rsfmodel <- rfsrc(Surv(time,status)~X1+X2,data=d)
plotPredictSurvProb(rsfmodel,newdata=ndat,times=ttt)




