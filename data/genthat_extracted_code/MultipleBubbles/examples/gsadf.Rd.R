library(MultipleBubbles)


### Name: gsadf
### Title: Critical values for generalized sup ADF statistic sequence.
### Aliases: gsadf
### Keywords: AugmentedDickey-FullerTest GSADFSequence MonteCarlo.

### ** Examples

foo <- gsadf(m = 20, t = 50)
quant <- rep(foo$quantiles[2], 100)
plot(quant, type = 'l')



