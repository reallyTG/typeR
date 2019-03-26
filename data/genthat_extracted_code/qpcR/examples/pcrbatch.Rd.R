library(qpcR)


### Name: pcrbatch
### Title: Batch calculation of qPCR efficiency and other qPCR parameters
### Aliases: pcrbatch
### Keywords: models nonlinear

### ** Examples

## First 4 runs and return parameters of fit
## do background subtraction using mean the first 5 cycles.
pcrbatch(reps, fluo = 2:5, baseline = "mean", basecyc = 1:5)

## Not run: 
##D ##  First 8 runs, with 4 replicates each, l5 model.
##D pcrbatch(reps, fluo = 2:9, model = l5, group = c(1,1,1,1,2,2,2,2))
##D 
##D ## Using model selection (Akaike weights) 
##D ## on the first 4 runs, runs 1 and 2 are replicates.
##D pcrbatch(reps, fluo = 2:5, group = c(1,1,2,3), 
##D          opt = TRUE, optPAR = list(crit = "weights"))
##D 
##D ## Fitting a sigmoidal and 'mak3' mechanistic model.
##D pcrbatch(reps, methods = c("sigfit", "mak3"))
##D 
##D ## Converting a 'modlist' to 'pcrbatch'.
##D ml5 <- modlist(reps, 1, 2:5, b5)
##D res5 <- pcrbatch(ml5)
##D 
##D ## Using Whittaker smoothing.
##D pcrbatch(reps, smooth = "whit")
## End(Not run)    



