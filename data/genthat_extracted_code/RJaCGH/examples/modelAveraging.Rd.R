library(RJaCGH)


### Name: modelAveraging
### Title: Method for model averaging for RJaCGH objects.
### Aliases: modelAveraging modelAveraging.RJaCGH
### Keywords: models

### ** Examples

## Not run: 
##D y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1),
##D        rnorm(100,0, 1)) 
##D Pos <- sample(x=1:500, size=230, replace=TRUE)
##D Pos <- cumsum(Pos)
##D Chrom <- rep(1:23, rep(10, 23))
##D 
##D jp <- list(sigma.tau.mu=rep(0.5, 5), sigma.tau.sigma.2=rep(0.3, 5),
##D sigma.tau.beta=rep(0.7, 5), tau.split.mu=0.5, tau.split.beta=0.5)
##D fit.genome <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Genome",
##D burnin=1000, TOT=10000, jump.parameters=jp, max.k=5)
##D mo <- modelAveraging(fit.genome)
##D print(mo)
## End(Not run)




