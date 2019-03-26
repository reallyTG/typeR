library(classiFunc)


### Name: classiKernel
### Title: Create a kernel estimator for functional data classification
### Aliases: classiKernel

### ** Examples

# How to implement your own kernel function
data("ArrowHead")
classes = ArrowHead[,"target"]

set.seed(123)
train_inds = sample(1:nrow(ArrowHead), size = 0.8 * nrow(ArrowHead), replace = FALSE)
test_inds = (1:nrow(ArrowHead))[!(1:nrow(ArrowHead)) %in% train_inds]

ArrowHead = ArrowHead[,!colnames(ArrowHead) == "target"]

# custom kernel
myTriangularKernel = function(u) {
  return((1 - abs(u)) * (abs(u) < 1))
}

# create the model
mod1 = classiKernel(classes = classes[train_inds], fdata = ArrowHead[train_inds,],
                    ker = "custom.ker", h = 2, custom.ker = myTriangularKernel)

# calculate the model predictions
pred1 = predict(mod1, newdata = ArrowHead[test_inds,], predict.type = "response")

# prediction accuracy
mean(pred1 == classes[test_inds])

# create another model using an existing kernel function
mod2 = classiKernel(classes = classes[train_inds], fdata = ArrowHead[train_inds,],
                    ker = "Ker.tri", h = 2)

# calculate the model predictions
pred2 = predict(mod1, newdata = ArrowHead[test_inds,], predict.type = "response")

# prediction accuracy
mean(pred2 == classes[test_inds])
## Not run: 
##D # Parallelize across 2 CPU's
##D library(parallelMap)
##D parallelStartSocket(2L) # parallelStartMulticore for Linux
##D predict(mod1, newdata =  fdata[test_inds,], predict.type = "prob", parallel = TRUE, batches = 2L)
##D parallelStop()
## End(Not run)



