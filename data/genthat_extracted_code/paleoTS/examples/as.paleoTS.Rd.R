library(paleoTS)


### Name: as.paleoTS
### Title: Paleontological time-series class
### Aliases: as.paleoTS read.paleoTS
### Keywords: models ts

### ** Examples

## create paleoTS object
 y <- as.paleoTS(mm=rnorm(10), vv=rep(1,10), nn=rep(25,10), tt=1:10, 
                 label="white noise time series")
 plot(y)



