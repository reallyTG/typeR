library(hybridEnsemble)


### Name: summary.CVhybridEnsemble
### Title: Summarize the performance of the cross-validated Hybrid Ensemble
### Aliases: summary.CVhybridEnsemble

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
##D summary(object=CVhE,stat='median')
##D summary(object=CVhE,stat='IQR')
##D 
##D #LaTeX table
##D #This code example shows how toppart and bottompart can be convenient if you want
##D #to concatenate multiple datasets (here six time the same dataset).
##D #Paste the output of this code in your LateX document:
##D cat(
##D  summary(object=CVhE ,name="Credit", LateX=TRUE, toppart=TRUE),
##D  summary(object=CVhE ,name="Credit", LateX=TRUE),
##D  summary(object=CVhE, name="Credit", LateX=TRUE),
##D  summary(object=CVhE ,name="Credit", LateX=TRUE),
##D  summary(object=CVhE ,name="Credit", LateX=TRUE),
##D  summary(object=CVhE ,name="Credit", LateX=TRUE, bottompart=TRUE) )
##D 
## End(Not run)



