library(MAclinical)


### Name: generate.learningsets
### Title: Generating learning sets
### Aliases: generate.learningsets
### Keywords: multivariate

### ** Examples

# load MAclinical library
# library(MAclinical)

# LOOCV
generate.learningsets(n=40,method="LOOCV")

# CV
generate.learningsets(n=40,method="CV",fold=5)
generate.learningsets(n=40,method="CV",fold=5,niter=3)

# MCCV
generate.learningsets(n=40,method="MCCV",niter=3,nlearn=30)

# bootstrap
generate.learningsets(n=40,method="bootstrap",niter=3)



