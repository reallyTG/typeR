library(SIBERG)


### Name: fitLN
### Title: Fit Log Normal Mixture Model
### Aliases: fitLN

### ** Examples

# artificial RNAseq data from negative binomial distribution
set.seed(1000)
dat <- rnbinom(100, mu=1000, size=1/0.2)
fitLN(y=dat)



