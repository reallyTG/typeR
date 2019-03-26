library(MortCast)


### Name: cokannisto.estimate
### Title: Coherent Kannisto Estimation
### Aliases: cokannisto.estimate

### ** Examples

data(mxM, mxF, package = "wpp2017")
country <- "Brazil"
mxm <- subset(mxM, name == country)[,"2010-2015"]
mxf <- subset(mxF, name == country)[,"2010-2015"]
cokannisto.estimate(mxm[18:21], mxf[18:21], ages = 18:21)




