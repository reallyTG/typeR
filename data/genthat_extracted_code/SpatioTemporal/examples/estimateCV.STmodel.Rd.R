library(SpatioTemporal)


### Name: estimateCV.STmodel
### Title: Cross-Validated Estimation and Prediction
### Aliases: estimateCV.STmodel estimateCV predictCV.STmodel predictCV

### ** Examples

##load data
data(mesa.model)
data(est.mesa.model)

################
## estimateCV ##
################
##create the CV structure defining 10 different CV-groups
Ind.cv <- createCV(mesa.model, groups=10, min.dist=.1)

##use the best parameters and there starting values as
x.init <- coef(est.mesa.model, pars="cov")[,c("par","init")]

## Not run: 
##D   ##estimate different parameters for each CV-group
##D   est.cv.mesa <- estimateCV(mesa.model, x.init, Ind.cv)
## End(Not run)
##lets load precomputed results instead
data(est.cv.mesa)

##examine the estimation results
print( est.cv.mesa )
##estimated parameters for each CV-group
coef(est.cv.mesa, pars="cov")

###############
## predictCV ##
###############
## Not run: 
##D   ##Do cross-validated predictions using the just estimated parameters
##D   ##Ind.cv is infered from est.cv.mesa as est.cv.mesa$Ind.cv
##D   pred.cv.mesa <- predictCV(mesa.model, est.cv.mesa, LTA=TRUE)
## End(Not run)
##lets load precomputed results instead
data(pred.cv.mesa)

##prediction results
print( pred.cv.mesa )

##and CV-statistics
print( summary( pred.cv.mesa, LTA=TRUE) )


## Not run: 
##D   ##A faster option is to only consider the observations and not to compute
##D   ##variances
##D   pred.cv.fast <- predictCV(mesa.model, est.cv.mesa, only.obs=TRUE,
##D                             pred.var=FALSE)
##D   print( pred.cv.fast )
##D   summary( pred.cv.fast )
## End(Not run)



