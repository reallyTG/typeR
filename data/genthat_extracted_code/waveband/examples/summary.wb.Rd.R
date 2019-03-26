library(waveband)


### Name: summary.wb
### Title: Print information about a wb object.
### Aliases: summary.wb
### Keywords: manip

### ** Examples

#
set.seed(1)
tmp <- wave.band(rnorm(32))
summary(tmp)
#Wave.band credible bands object
#Bands produced for object in data component of length:  32
#Credible intervals are in the bands component
#Wave.band Bayesian hyperparameter alpha was:  0.5
#Wave.band Bayesian hyperparameter beta was:  1
#Wave.band Wavelet filter number was:  8
#Wave.band Wavelet family was:  DaubLeAsymm
#Type of input (data or test signal): data
#Rsnr (if applicable):  3



