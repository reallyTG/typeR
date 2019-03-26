library(classiFunc)


### Name: classiKnn
### Title: Create a knn estimator for functional data classification.
### Aliases: classiKnn

### ** Examples

# Classification of the Phoneme data
data(Phoneme)
classes = Phoneme[,"target"]

set.seed(123)
# Use 80% of data as training set and 20% as test set
train_inds = sample(1:nrow(Phoneme), size = 0.8 * nrow(Phoneme), replace = FALSE)
test_inds = (1:nrow(Phoneme))[!(1:nrow(Phoneme)) %in% train_inds]

# create functional data as matrix with observations as rows
fdata = Phoneme[,!colnames(Phoneme) == "target"]

# create k = 3 nearest neighbors classifier with L2 distance (default) of the
# first order derivative of the data
mod = classiKnn(classes = classes[train_inds], fdata = fdata[train_inds,],
                 nderiv = 1L, knn = 3L)

# predict the model for the test set
pred = predict(mod, newdata =  fdata[test_inds,], predict.type = "prob")

## Not run: 
##D # Parallelize across 2 CPU's
##D library(parallelMap)
##D parallelStartSocket(cpus = 2L) # parallelStartMulticore(cpus = 2L) for Linux
##D predict(mod, newdata =  fdata[test_inds,], predict.type = "prob", parallel = TRUE, batches = 2L)
##D parallelStop()
## End(Not run)




