library(MNM)


### Name: plotShape
### Title: Pairwise Scatterplot Matrix of Shape Matrices
### Aliases: plotShape
### Keywords: hplot

### ** Examples

X <- rmvt(100, diag(3), df=3)

EST1 <- list(location=colMeans(X), scatter=cov(X), est.name="COV")
HR <- HR.Mest(X)
EST2 <- list(location=HR$center, scatter=HR$scatter, est.name="Tyler")
plotShape(EST1,EST2, X=X)



