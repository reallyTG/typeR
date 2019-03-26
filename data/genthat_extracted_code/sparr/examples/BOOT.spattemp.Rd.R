library(sparr)


### Name: BOOT.spattemp
### Title: Bootstrap bandwidths for a spatiotemporal kernel density
###   estimate
### Aliases: BOOT.spattemp

### ** Examples

## No test: 

data(burk) # Burkitt's Uganda lymphoma data
burkcas <- burk$cases

#~85 secs
hlam1 <- BOOT.spattemp(burkcas) 

#~75 secs. Widen time limits, reduce ref. bw.
hlam2 <- BOOT.spattemp(burkcas,tlim=c(400,5800),eta=8,nu=450) 

#~150 secs. Increase ref. bw., custom starting vals
hlam3 <- BOOT.spattemp(burkcas,eta=20,nu=800,start=c(7,400)) 

rbind(hlam1,hlam2,hlam3)
## End(No test)



