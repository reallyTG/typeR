library(RJaCGH)


### Name: RJaCGH
### Title: Reversible Jump MCMC for the analysis of arrays of CGH
### Aliases: RJaCGH
### Keywords: models

### ** Examples

y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1),
       rnorm(100,0, 1)) 
Pos <- sample(x=1:500, size=230, replace=TRUE)
Pos <- cumsum(Pos)
Chrom <- rep(1:23, rep(10, 23))

jp <- list(sigma.tau.mu=rep(0.05, 4), sigma.tau.sigma.2=rep(0.03, 4),
           sigma.tau.beta=rep(0.07, 4), tau.split.mu=0.1, tau.split.beta=0.1)

fit.chrom <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Chrom",
                    burnin=10, TOT=1000, k.max = 4,
                    jump.parameters=jp)
##RJ results for chromosome 5
table(fit.chrom[["array1"]][[5]]$k)
fit.genome <- RJaCGH(y=y, Pos=Pos, Chrom=Chrom, model="Genome",
burnin=100, TOT=1000, jump.parameters=jp, k.max = 4)
## Results for the model with 3 states:
summary(fit.genome)



