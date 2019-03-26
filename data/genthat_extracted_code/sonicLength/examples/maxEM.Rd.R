library(sonicLength)


### Name: maxEM
### Title: maximum likelihood estimates relative abundances
### Aliases: maxEM
### Keywords: models

### ** Examples

mat0 <- matrix(0,nr=48,nc=140)
vals <- c(rep(1,100),2:40,100)
mat1 <- sapply( vals, function(x) as.numeric(is.element(1:200 ,rgeom(x,.02))))
mat <- rbind(mat0,mat1)
posVals <- colSums(mat) > 0
vals <- vals[ posVals ]
mat <- mat[, posVals ]
rownames(mat) <- 1:nrow(mat)
res <- maxEM(mat)
matplot( vals, cbind(res$theta, colSums(mat)), pch=1:2,
        xlab='original values', ylab='estimated values',
        main='Simulated Sonicants and Estimates')
legend( "bottomright", pch=1:2, col=1:2,
        legend=c(expression(hat(theta)[j]),expression(sum(y[ij],i))))
abline(a=0,b=1,col='gray')



