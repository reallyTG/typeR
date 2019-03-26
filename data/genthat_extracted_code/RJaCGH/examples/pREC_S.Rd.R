library(RJaCGH)


### Name: pREC_S
### Title: Subgroups of arrays that share common alterations
### Aliases: pREC_S
### Keywords: models

### ** Examples

## MCR for a single array:
y <- c(rnorm(100, 0, 1), rnorm(10, -3, 1), rnorm(20, 3, 1),
       rnorm(100,0, 1)) 
z <- c(rnorm(110, 0, 1), rnorm(20, 3, 1),
       rnorm(100,0, 1)) 
zz <- c(rnorm(90, 0, 1), rnorm(40, 3, 1),
       rnorm(100,0, 1)) 

Pos <- sample(x=1:500, size=230, replace=TRUE)
Pos <- cumsum(Pos)
Chrom <- rep(1:23, rep(10, 23))

jp <- list(sigma.tau.mu=rep(0.05, 4), sigma.tau.sigma.2=rep(0.03, 4),
           sigma.tau.beta=rep(0.07, 4), tau.split.mu=0.1, tau.split.beta=0.1)

fit.array.genome <- RJaCGH(y=cbind(y,z,zz),
Pos=Pos, Chrom=Chrom, model="Genome",
burnin=1000, TOT=1000, jump.parameters=jp, k.max = 4)
pREC_S(fit.array.genome, p=0.4, freq.array=2,
alteration="Gain")
pREC_S(fit.array.genome, p=0.4, freq.array=2, alteration="Loss")



