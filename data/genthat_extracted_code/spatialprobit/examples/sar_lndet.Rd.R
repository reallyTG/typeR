library(spatialprobit)


### Name: sar_lndet
### Title: Approximation of the log determinant ln|I_n - rho*W| of a
###   spatial weight matrix
### Aliases: sar_lndet lndetfull lndetChebyshev

### ** Examples

require(Matrix)

# sparse matrix representation for spatial weight matrix W (d x d) 
# and m nearest neighbors
d <- 10
m <- 3
W <- sparseMatrix(i=rep(1:d, each=m), 
  j=replicate(d, sample(x=1:d, size=m, replace=FALSE)), x=1/m, dims=c(d, d))

# exact log determinant
ldet1 <- sar_lndet(ldetflag=0, W, rmin=-1, rmax=1)

# Chebychev approximation of log determinant
ldet2 <- sar_lndet(ldetflag=1, W, rmin=-1, rmax=1)

plot(ldet1$detval[,1], ldet1$detval[,2], type="l", col="black", 
  xlab="rho", ylab="ln|I_n - rho W|",
  main="Log-determinant ln|I_n - rho W| Interpolations")
lines(ldet2$detval[,1], ldet2$detval[,2], type="l", col="red")
legend("bottomleft", legend=c("Exact log-determinant", "Chebychev approximation"), 
  lty=1, lwd=1, col=c("black","red"), bty="n")




