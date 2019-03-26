library(easyCODA)


### Name: PLOT.PCA
### Title: Plot the results of a principal component analysis
### Aliases: PLOT.PCA
### Keywords: multivariate

### ** Examples

# perform weighted PCA on the ALRs of the RomanCups data set
# where the first oxide silica is chosen as the denominator
data(cups)
cups.ALR <- ALR(cups, denom=1)
cups.PCA <- PCA(cups.ALR)
PLOT.PCA(cups.PCA, map="contribution", rescale=0.2, axes.inv=c(1,-1))	



