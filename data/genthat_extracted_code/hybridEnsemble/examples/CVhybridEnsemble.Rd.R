library(hybridEnsemble)


### Name: CVhybridEnsemble
### Title: Five times twofold cross-validation for the Hybrid Ensemble
###   function
### Aliases: CVhybridEnsemble

### ** Examples

data(Credit)

## Not run: 
##D CVhE <- CVhybridEnsemble(x=Credit[1:200,names(Credit) != 'Response'],
##D                     y=Credit$Response[1:200],
##D                     verbose=TRUE,
##D                     KF.rp=1,
##D                     RF.ntree=50,
##D                     AB.iter=50,
##D                     NN.size=5,
##D                     NN.decay=0,
##D                     SV.gamma = 2^-15,
##D                     SV.cost = 2^-5,
##D                     SV.degree=2,
##D                     SV.kernel='radial')
## End(Not run)



