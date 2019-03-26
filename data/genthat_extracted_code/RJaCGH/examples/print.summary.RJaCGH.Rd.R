library(RJaCGH)


### Name: print.summary.RJaCGH
### Title: print summary of RJaCGH fit
### Aliases: print.summary.RJaCGH print.summary.RJaCGH.Chrom
###   print.summary.RJaCGH.Genome
### Keywords: models

### ** Examples

y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1), rnorm(100,
0, 1))
Pos <- sample(x=1:500, size=230, replace=TRUE)
Pos <- cumsum(Pos)
Chrom <- rep(1:23, rep(10, 23))
jp <- list(sigma.tau.mu=rep(0.5, 5), sigma.tau.sigma.2=rep(0.3, 5),
sigma.tau.beta=rep(0.7, 5), tau.split.mu=0.5, tau.split.beta=0.5)
fit.chrom <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Chrom",
burnin=10, TOT=100, jump.parameters=jp, k.max = 5)
summary(fit.chrom)



