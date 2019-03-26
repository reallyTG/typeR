library(qtl)


### Name: pull.rf
### Title: Pull out recombination fractions or LOD scores from a cross
###   object
### Aliases: pull.rf
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=5)
## End(Don't show)
fake.f2 <- est.rf(fake.f2)
rf <- pull.rf(fake.f2)
lod <- pull.rf(fake.f2, "lod")
plot(rf[1,], lod[1,], xlab="rec frac", ylab="LOD score")
marker <- markernames(fake.f2, chr=5)[6]
par(mfrow=c(2,1))
plot(rf, marker, bandcol="gray70")
plot(lod, marker, bandcol="gray70")



