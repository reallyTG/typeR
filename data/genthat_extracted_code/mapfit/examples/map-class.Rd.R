library(mapfit)


### Name: map-class
### Title: Classes of MAP
### Aliases: map-class gmmpp-class
### Keywords: classes

### ** Examples

## create an MAP (full matrix) with 5 phases
map(5)

## create an MAP (full matrix) with 5 phases
map(size=5)

## create an MMPP with 5 states
mmpp(5)

## create an MMPP with 5 states for approximate
## estimation
gmmpp(5)

## create an MAP with specific parameters
(param <- map(alpha=c(1,0,0),
	D0=rbind(c(-4,2,0),c(2,-5,1),c(1,0,-4)),
	D1=rbind(c(1,1,0),c(1,0,1),c(2,0,1))))

## marginal moments of MAP
map.mmoment(k=3, map=param)

## joint moments of MAP
map.jmoment(lag=1, map=param)

## k-lag correlation
map.acf(map=param)




