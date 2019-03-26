library(m2b)


### Name: ltraj2xytb
### Title: ltraj object conversion to xytb object
### Aliases: ltraj2xytb

### ** Examples

#track_CAGA_005 is a dataset
xytb<-xytb(track_CAGA_005,"a track",3,.5)
ltraj<-xytb2ltraj(xytb)
xytb2<-ltraj2xytb(ltraj,"a track")



