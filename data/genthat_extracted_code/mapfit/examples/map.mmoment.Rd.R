library(mapfit)


### Name: map.acf
### Title: Moments for Markovian arrival pcess (MAP)
### Aliases: map.mmoment map.jmoment map.acf
### Keywords: distribution

### ** Examples

## create an MAP with specific parameters
(param1 <- map(alpha=c(1,0,0),
	D0=rbind(c(-4,2,0),c(2,-5,1),c(1,0,-4)),
	D1=rbind(c(1,1,0),c(1,0,1),c(2,0,1))))

## create an ER-HMM with specific parameters
(param2 <- erhmm(shape=c(2,3), alpha=c(0.3,0.7),
                rate=c(1.0,10.0),
                P=rbind(c(0.3, 0.7), c(0.1, 0.9))))

## marginal moments of MAP
map.mmoment(k=3, map=param1)
map.mmoment(k=3, map=as(param2, "map"))

## joint moments of MAP
map.jmoment(lag=1, map=param1)
map.jmoment(lag=1, map=as(param2, "map"))

## k-lag correlation
map.acf(map=param1)
map.acf(map=as(param2, "map"))




