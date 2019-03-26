library(m2b)


### Name: xytb2ltraj
### Title: xytb class conversion to ltraj object
### Aliases: xytb2ltraj

### ** Examples

#track_CAGA_005 is a dataset
xytb<-xytb(track_CAGA_005,"a track",3,.5)
ltraj<-xytb2ltraj(xytb)
#all adehabitatLT function are now available
summary(ltraj)
plot(ltraj)



