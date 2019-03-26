library(mapfit)


### Name: erhmm
### Title: ER-HMM (HMM with Erlang outputs)
### Aliases: erhmm

### ** Examples


## create an ER-HMM consisting of two Erlang components with
## shape parameters 2 and 3.
erhmm(c(2,3))

## create an ER-HMM consisting of two Erlang components with
## shape parameters 2 and 3.
erhmm(shape=c(2,3))

## create an ER-HMM with specific parameters
(param <- erhmm(shape=c(2,3), alpha=c(0.3,0.7),
                rate=c(1.0,10.0),
                P=rbind(c(0.3, 0.7), c(0.1, 0.9))))

## convert to a general MAP
as(param, "map")

## marginal moments of MAP
map.mmoment(k=3, map=as(param, "map"))

## joint moments of MAP
map.jmoment(lag=1, map=as(param, "map"))

## k-lag correlation
map.acf(map=as(param, "map"))




