library(eba)


### Name: strans
### Title: Stochastic Transitivity
### Aliases: strans print.strans
### Keywords: models

### ** Examples

data(celebrities)           # absolute choice frequencies
strans(celebrities)         # WST and MST hold, but not SST
strans(celebrities)$pcm     # re-ordered relative frequencies
strans(celebrities)$violdf  # transitivity violations



