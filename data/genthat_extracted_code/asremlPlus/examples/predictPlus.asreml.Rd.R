library(asremlPlus)


### Name: predictPlus.asreml
### Title: Forms the predictions for a term, their pairwise differences and
###   associated statistics. A factor having parallel values may occur in
###   the model and a linear transformation of the predictions can be
###   specified. It results in an object of class alldifffs.
### Aliases: predictPlus.asreml predictPlus
### Keywords: asreml

### ** Examples
## Not run: 
##D data(WaterRunoff.dat)
##D asreml.options(keep.order = TRUE) #required for asreml-R4 only
##D current.asr <- asreml(fixed = pH ~ Benches + (Sources * (Type + Species)), 
##D                       random = ~ Benches:MainPlots,
##D                       keep.order=TRUE, data= WaterRunoff.dat)
##D current.asrt <- asrtests(current.asr, NULL, NULL)
##D diffs <- predictPlus(classify = "Sources:Type", 
##D                      asreml.obj = current.asr, 
##D                      wald.tab = current.asrt$wald.tab, 
##D                      present = c("Sources", "Type", "Species"))
## End(Not run)


