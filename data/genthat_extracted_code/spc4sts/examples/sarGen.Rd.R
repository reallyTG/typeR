library(spc4sts)


### Name: sarGen
### Title: Stochastic Autoregressive Image Generator
### Aliases: sarGen

### ** Examples

## generate an image without defects
img <- sarGen(m = 100, n = 100, border = 50)
image(img,col=gray(c(0:32)/32))



