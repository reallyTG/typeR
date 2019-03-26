library(metaforest)


### Name: extract_proximity
### Title: Extract proximity matrix for a MetaForest object.
### Aliases: extract_proximity

### ** Examples

## Don't show: 
set.seed(42)
data <- SimulateSMD(k_train = 100, distribution = "bernoulli", model = es *
                    x[,1]*x[,2])
#Conduct unweighted MetaForest analysis
mf.unif <- MetaForest(formula = yi ~ ., data = data$training,
                      whichweights = "unif", method = "DL")
prox_matrix <- extract_proximity(mf.unif)
## End(Don't show)



