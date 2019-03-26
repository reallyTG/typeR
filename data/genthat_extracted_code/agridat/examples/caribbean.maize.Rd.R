library(agridat)


### Name: caribbean.maize
### Title: Multi-environment trial of maize with fertilization
### Aliases: caribbean.maize
### Keywords: datasets

### ** Examples

data(caribbean.maize)
dat <- caribbean.maize

# Yield and ears are correlated
require(lattice)
xyplot(yield~ears|site, dat, ylim=c(0,10), subset=isle=="Antigua",
       main="caribbean.maize - Antiqua")

# Some locs show large response to nitrogen (as expected), e.g. UISV, OOSV
dotplot(trt~yield|site, data=dat, main="caribbean.maize treatment response")

# The pattern is a bit hard to see, so we split the treatment factor
# into separate factors, and group sites by island
dat <- transform(dat, N=factor(substring(trt,2,2)),
                      P=factor(substring(trt,3,3)),
                      K=factor(substring(trt,4,4)))
dat <- transform(dat, env=paste(substring(isle,1,1),site,sep="-"))
# Now we can see the strong N*site interaction
bwplot(yield~N|env, dat,
       main="caribbean.maize", xlab="nitrogen")



