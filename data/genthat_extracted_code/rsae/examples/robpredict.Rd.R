library(rsae)


### Name: robpredict
### Title: Robust prediction of random effects, fixed effects, and
###   area-specific means
### Aliases: robpredict print.meanssaemodel plot.meanssaemodel
###   residuals.meanssaemodel

### ** Examples

#generate the synthetic data/model
mymodel <- makedata()
#compute Huber M-estimation type estimates of the model "mymodel"
#robustness tuning constant k = 2
myfittedmodel <- fitsaemodel("huberm", mymodel, k=2)
myfittedmodel
#get a summary of the model
summary(myfittedmodel)
#robustly predict the random effects and the area-level means.  
#Here, we choose the robustness tuning constant k equal to 1.8
mypredictions <- robpredict(myfittedmodel, k=1.8)
mypredictions



