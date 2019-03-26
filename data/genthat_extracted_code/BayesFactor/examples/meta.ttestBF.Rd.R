library(BayesFactor)


### Name: meta.ttestBF
### Title: Function for Bayesian analysis of one- and two-sample designs
### Aliases: meta.ttestBF
### Keywords: htest

### ** Examples

## Bem's (2010) data (see Rouder & Morey, 2011)
t=c(-.15,2.39,2.42,2.43)
N=c(100,150,97,99)

## Using rscale=1 and one-sided test to be
## consistent with Rouder & Morey (2011)
bf = meta.ttestBF(t, N, rscale=1, nullInterval=c(0, Inf))
bf[1]

## plot posterior distribution of delta, assuming alternative
## turn off progress bar for example
samples = posterior(bf[1], iterations = 1000, progress = FALSE)
## Note that posterior() respects the nullInterval
plot(samples)
summary(samples)



