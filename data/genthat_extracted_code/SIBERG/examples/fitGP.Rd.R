library(SIBERG)


### Name: fitGP
### Title: Fit Generalized Poisson Mixture Model
### Aliases: fitGP

### ** Examples

# artificial RNAseq data from negative binomial distribution
set.seed(1000)
dat <- rnbinom(100, mu=1000, size=1/0.2)
fitGP(y=dat)



