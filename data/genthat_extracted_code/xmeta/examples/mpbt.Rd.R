library(xmeta)


### Name: mpbt
### Title: Testing and correcting for publication bias of multivariate
###   meta-analysis
### Aliases: mpbt
### Keywords: Multivariate meta-analysis Publication bias Score test

### ** Examples

data(prostate)
fit.mpbt=mpbt(data=prostate, method = "nn.cl", type = "continuous", k=2)
summary(fit.mpbt)



