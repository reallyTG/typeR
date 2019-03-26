library(MultipleBubbles)


### Name: sadf
### Title: Critical values for sup ADF statistic sequence.
### Aliases: sadf
### Keywords: AugmentedDickey-FullerTest, MonteCarlo. supADFSequence

### ** Examples

foo <- sadf(m = 20, t = 50)
quant <- rep(foo$quantiles[2], 100)
plot(quant, type = 'l')



