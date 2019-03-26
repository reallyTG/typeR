library(xmeta)


### Name: mmeta
### Title: Methods for multiviarate random-effects meta-analysis
### Aliases: mmeta
### Keywords: random-effects mutlviariate meta-analysis meta-analysis of
###   diagnostic accuracy study

### ** Examples

data(prostate)
fit.nn=mmeta(data=prostate, type="continuous", k=2, method="nn.cl") 
summary(fit.nn)

rhow=runif(dim(prostate)[1], -0.2, 0.8)
fit.reml=mmeta(data=prostate, rhow=rhow, type="continuous", k=2, method="nn.reml") 
print(fit.reml)

data(nat2)
fit.bb=mmeta(data=nat2, type="binary", k=2, method="bb.cl") 
summary(fit.bb)

data(ca125)
fit.tb=mmeta(data=ca125, type="binary", k=2, method="tb.cl") 
summary(fit.tb)



