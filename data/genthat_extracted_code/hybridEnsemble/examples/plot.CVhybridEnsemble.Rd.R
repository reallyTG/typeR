library(hybridEnsemble)


### Name: plot.CVhybridEnsemble
### Title: Plot the performance of the cross-validated Hybrid Ensemble
### Aliases: plot.CVhybridEnsemble

### ** Examples

data(Credit)

## Not run: 
##D CVhE <- CVhybridEnsemble(x=Credit[1:200,names(Credit) != 'Response'],
##D                     y=Credit$Response[1:200],
##D                     verbose=TRUE,
##D                     RF.ntree=50,
##D                     KF.rp=1,
##D                     AB.iter=50,
##D                     NN.size=5,
##D                     NN.decay=0,
##D                     SV.gamma = 2^-15,
##D                     SV.cost = 2^-5,
##D                     SV.degree=2,
##D                     SV.kernel='radial')
##D 
##D plot(x=CVhE,ROCcurve= FALSE)
##D plot(x=CVhE,ROCcurve= TRUE)
## End(Not run)



