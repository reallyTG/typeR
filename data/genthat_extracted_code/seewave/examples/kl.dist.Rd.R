library(seewave)


### Name: kl.dist
### Title: Kullback-Leibler distance
### Aliases: kl.dist
### Keywords: distribution ts

### ** Examples

# Comparison of two spectra
data(tico)
tico1 <- spec(tico, at=0.65, plot=FALSE)
tico2 <- spec(tico, at=1.1, plot=FALSE)
kl.dist(tico1, tico2)    # log2 (binary logarithm)
kl.dist(tico1, tico2, base=exp(1))  # ln (natural logarithm)



