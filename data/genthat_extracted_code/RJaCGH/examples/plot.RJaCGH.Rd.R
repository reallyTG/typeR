library(RJaCGH)


### Name: plot.RJaCGH
### Title: 'plot' method for RJaCGH objects
### Aliases: plot.RJaCGH
### Keywords: models

### ** Examples


## Not run: 
##D y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1), rnorm(100,
##D                                                                   0, 1))
##D Pos <- round(runif(230))
##D Pos <- cumsum(Pos)
##D Chrom <- rep(1:23, rep(10, 23))
##D jp <- list(sigma.tau.mu=rep(0.5, 4), sigma.tau.sigma.2=rep(0.3, 4),
##D            sigma.tau.beta=rep(0.7, 4), tau.split.mu=0.5, tau.split.beta=0.5)
##D fit.Chrom <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Chrom",
##D                     burnin=100, TOT=1000, jump.parameters=jp, k.max=4)
##D fit.Genom <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Genome", burnin=100,
##D                     TOT=1000, jump.parameters=jp, k.max=4)
##D fit.none <- RJaCGH(y=y, Pos=Pos, Chrom=NULL, model="None",
##D                    burnin=100, TOT=1000, jump.parameters=jp, k.max=4)
##D 
##D plot(fit.Chrom)
##D plot(fit.Chrom, array="array1")
##D plot(fit.Genom)
##D plot(fit.none)
##D 
##D 
##D y2 <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1),
##D         rnorm(100, 0, 1))
##D 
##D ya <- cbind(y, y2)
##D 
##D fit.Chrom.array <- RJaCGH(y=ya, Pos=Pos, Chrom=Chrom, model="Chrom",
##D       burnin=100, TOT=1000, jump.parameters=jp, k.max=4)
##D fit.Genom.array <- RJaCGH(y=ya, Pos=Pos, Chrom=Chrom, model="Genome",
##D       burnin=100, TOT=1000, jump.parameters=jp, k.max=4)
##D fit.none.array <- RJaCGH(y=ya, Pos=Pos, Chrom=NULL, model="None",
##D       burnin=100, TOT=1000, jump.parameters=jp, k.max=4)
##D 
##D plot(fit.Chrom.array)
##D plot(fit.Genom.array)
##D plot(fit.none.array)
##D 
## End(Not run)



