library(cem)


### Name: combine.spacegraphs
### Title: Combine two spacegraph objects.
### Aliases: combine.spacegraphs
### Keywords: datagen

### ** Examples

## Not run: 
##D data(LL)
##D 
##D sp1 <- spacegraph("treated", LL, drop="re78", M=5,
##D                   R=list(cem=5,psm=5, mdm=0))
##D 
##D ## Note that we must use the same L1 measure from the first spacegraph!
##D sp2 <- spacegraph("treated", LL, drop="re78", raw.profile=sp1$raw.profile,
##D                   R=list(cem=0,psm=0, mdm=5))
##D 
##D sp3 <- combine.spacegraphs(sp1,sp2)
##D 
##D plot(sp3)
## End(Not run)



