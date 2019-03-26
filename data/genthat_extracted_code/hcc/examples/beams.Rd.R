library(hcc)


### Name: beams
### Title: The strength of ten wood beams are effected by the specific
###   gravity and moisture content
### Aliases: beams
### Keywords: datasets

### ** Examples

data(beams)
mod <-lm(y ~ x1+x2, data=beams)
x <- beams[, 2]
res <- resid(mod)
hctest(x, res)



