library(seewave)


### Name: preemphasis
### Title: Pre-emphasis speech filter
### Aliases: preemphasis
### Keywords: ts filter

### ** Examples

data(sheep)
fc <- 150
f <- sheep@samp.rate
alpha <- exp(-2*pi*fc/f)
res <- preemphasis(sheep, alpha=alpha, output="Wave")



