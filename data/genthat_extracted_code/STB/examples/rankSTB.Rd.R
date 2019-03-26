library(STB)


### Name: rankSTB
### Title: Rank-Based Algorithm for Computing 100(1-alpha)% Simulataneous
###   Tolerance Bounds.
### Aliases: rankSTB

### ** Examples

## Not run: 
##D # for following problem size the rank-based algo
##D # outperforms the quantile based one, although,
##D # ran serially
##D mat <- matrix(rnorm(10000*100), ncol=100)
##D mat <- t(apply(mat, 1, sort))
##D system.time(stb.rank <- rankSTB(mat))
##D system.time(stb.q.R  <- getSTB(mat))
##D system.time(stb.q.C  <- fastSTB(mat))
##D x <- apply(mat, 2, mean)
##D plot(x,x, ylim=c(-5,5))
##D lines(x, stb.q.R$Q[1,], col="blue", lwd=2)
##D lines(x, stb.q.R$Q[2,], col="blue", lwd=2)
##D lines(x, stb.q.C$Q[1,], col="red",  lwd=2)
##D lines(x, stb.q.C$Q[2,], col="red",  lwd=2)
##D lines(x, stb.rank$Q[1,],  col="cyan", lwd=2)
##D lines(x, stb.rank$Q[2,],  col="cyan", lwd=2)
##D legend("top", legend=c("R-quantile", "C-quantile", "rank-based"), 
##D        fill=c("blue", "red", "cyan"))
##D 
##D # varying Ncpu for the C-implementation of the quantile-based algo
##D system.time(stb.q.C  <- fastSTB(mat, Ncpu=4))
##D system.time(stb.q.C  <- fastSTB(mat, Ncpu=6))
##D system.time(stb.q.C  <- fastSTB(mat, Ncpu=8))
##D system.time(stb.q.C  <- fastSTB(mat, Ncpu=10))
##D system.time(stb.q.C  <- fastSTB(mat, Ncpu=12))
## End(Not run)



