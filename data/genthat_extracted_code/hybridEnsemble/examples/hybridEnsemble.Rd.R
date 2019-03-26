library(hybridEnsemble)


### Name: hybridEnsemble
### Title: Binary classification with Hybrid Ensemble
### Aliases: hybridEnsemble

### ** Examples

data(Credit)

## Not run: 
##D hE <-hybridEnsemble(x=Credit[1:100,names(Credit) != 'Response'],
##D                     y=Credit$Response[1:100],
##D                     RF.ntree=50,
##D                     AB.iter=50,
##D                     NN.size=5,
##D                     NN.decay=0,
##D                     SV.gamma = 2^-15,
##D                     SV.cost = 2^-5,
##D                     SV.degree=2,
##D                     SV.kernel='radial')
## End(Not run)



