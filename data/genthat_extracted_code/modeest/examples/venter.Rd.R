library(modeest)


### Name: venter
### Title: The Venter / Dalenius / LMS mode estimator
### Aliases: venter Venter shorth

### ** Examples

library(evd)

# Unimodal distribution
x <- rgev(1000, loc = 23, scale = 1.5, shape = 0)

## True mode
gevMode(loc = 23, scale = 1.5, shape = 0)

## Estimate of the mode
venter(x, bw = 1/3)
mlv(x, method = "venter", bw = 1/3)




