library(SIBERG)


### Name: fitNB
### Title: Fit Negative Binomial Mixture Model
### Aliases: fitNB

### ** Examples

# artificial RNAseq data from negative binomial distribution
set.seed(1000)
dat <- rnbinom(100, mu=1000, size=1/0.2)
fitNB(y=dat)



