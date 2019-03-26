library(stratification)


### Name: strata.tool
### Title: Functions to Visualize Stratified Designs
### Aliases: print.strata plot.strata
### Keywords: methods

### ** Examples

cumrootf <- strata.cumrootf(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), nclass=500)
print(cumrootf)
plot(cumrootf)
plot(cumrootf, drop=5)
plot(cumrootf, logscale=TRUE)
geo <- strata.geo(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5))
print(geo)
plot(geo, logscale=TRUE)
# The geometric method does not perform well because of some small units
LH <- strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1)
print(LH)
plot(LH, logscale=TRUE)



