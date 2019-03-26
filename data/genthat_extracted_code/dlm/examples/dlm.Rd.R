library(dlm)


### Name: dlm
### Title: dlm objects
### Aliases: dlm as.dlm is.dlm
### Keywords: misc

### ** Examples

## Linear regression as a DLM
x <- matrix(rnorm(10),nc=2)
mod <- dlmModReg(x)
is.dlm(mod)

## Adding dlm's
dlmModPoly() + dlmModSeas(4) # linear trend plus quarterly seasonal component



