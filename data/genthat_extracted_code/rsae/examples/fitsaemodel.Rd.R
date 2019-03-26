library(rsae)


### Name: fitsaemodel
### Title: Fit SAE model using various methods
### Aliases: fitsaemodel print.fitsaemodel summary.fitsaemodel
###   coef.fitsaemodel convergence

### ** Examples

#generate the synthetic data/model
mymodel <- makedata()
#compute Huber M-estimation type estimates of the model "mymodel"
#robustness tuning constant k = 2
myfittedmodel <- fitsaemodel("huberm", mymodel, k=2)
myfittedmodel
#get a summary of the model
summary(myfittedmodel)



