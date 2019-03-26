library(qpcR)


### Name: is.outlier
### Title: Outlier summary for objects of class 'modlist' or 'replist'
### Aliases: is.outlier
### Keywords: models nonlinear

### ** Examples

## Analyze in respect to amplification
## efficiency outliers.
ml1 <- modlist(reps, 1, 2:5)
res1 <- KOD(ml1, check = "uni2")

## Which runs are outliers?
outl <- is.outlier(res1)
outl
which(outl)

## Not run: 
##D ## Test for sigmoidal outliers
##D ## with the 'testdat' dataset.
##D ml2 <- modlist(testdat, model = l5, check = "uni2")
##D is.outlier(ml2)    
## End(Not run)



