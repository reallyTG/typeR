library(EMD)


### Name: cvtype
### Title: Generating test dataset index for cross-validation
### Aliases: cvtype
### Keywords: nonparametric

### ** Examples

# Traditional 4-fold cross-validation for 100 observations
cvtype(n=100, cv.bsize=1, cv.kfold=4, cv.random=FALSE)
# Random 4-fold cross-validation with block size 2 for 100 observations
cvtype(n=100, cv.bsize=2, cv.kfold=4, cv.random=TRUE)



