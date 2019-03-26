library(chemmodlab)


### Name: plot.chemmodlab
### Title: Plot method for the chemmodlab class.
### Aliases: plot.chemmodlab

### ** Examples

## Not run: 
##D # A data set with  binary response and multiple descriptor sets
##D data(aid364)
##D 
##D cml <- ModelTrain(aid364, ids = TRUE, xcol.lengths = c(24, 147), 
##D                   des.names = c("BurdenNumbers", "Pharmacophores"))
##D plot(cml)
## End(Not run)

# A continuous response
cml <- ModelTrain(USArrests, nsplits = 2, nfolds = 2,
                  models = c("KNN", "Lasso", "Tree"))
plot(cml)




