library(RWiener)


### Name: miscellaneous
### Title: Miscellaneous Wiener Diffusion model functions
### Aliases: is.wiener as.wiener numdata.wiener data.wiener revamp
###   revamp.data.wiener revamp.numdata.wiener revamp.data.frame
### Keywords: is.wiener as.wiener revamp.numdata.wiener revamp.data.wiener

### ** Examples

## generate data
dat <- rwiener(100, 4,.35,.5,0.8)

## simple function calls
is.wiener(dat)
dat <- as.data.frame(dat)
dat <- as.wiener(dat)
y <- revamp(dat)
y
revamp(y)



