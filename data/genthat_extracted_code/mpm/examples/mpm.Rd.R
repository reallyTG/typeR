library(mpm)


### Name: mpm
### Title: Spectral Map Analysis...
### Aliases: mpm
### Keywords: multivariate

### ** Examples
data(Golub)
# Principal component analysis
r.pca <- mpm(Golub[,1:39], center = "column", normal = "column")
# Correspondence factor analysis
r.cfa <- mpm(Golub[,1:39],logtrans = FALSE, row.weight = "mean",
col.weight = "mean", closure = "double")
# Weighted spectral map analysis
r.sma <- mpm(Golub[,1:39], row.weight = "mean", col.weight = "mean")


