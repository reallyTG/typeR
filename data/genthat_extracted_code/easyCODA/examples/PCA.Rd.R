library(easyCODA)


### Name: PCA
### Title: Principal component analysis
### Aliases: PCA
### Keywords: multivariate

### ** Examples

# compute logratios of Vegetables data set
data(veg)
veg.LR <- LR(veg)
# unweighted PCA biplot of the results
veg.PCA <- PCA(veg.LR$LR, weight=FALSE)
PLOT.PCA(veg.PCA, map="asymmetric")



