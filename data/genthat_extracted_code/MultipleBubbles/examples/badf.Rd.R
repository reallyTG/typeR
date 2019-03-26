library(MultipleBubbles)


### Name: badf
### Title: Backward Augmented Dickey-Fuller Sequence.
### Aliases: badf
### Keywords: AugmentedDickey-FullerTest BackwardADFSequence MonteCarlo.

### ** Examples

foo <- badf(m = 100, t = 50, adflag = 1, mflag = 1)
plot(foo$quantiles[2,], type = 'l')



