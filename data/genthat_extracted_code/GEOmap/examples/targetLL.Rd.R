library(GEOmap)


### Name: targetLL
### Title: Target Lat-Lon
### Aliases: targetLL
### Keywords: misc

### ** Examples


sta=list( lat=rnorm(10, mean=60, sd=0.5),
lon = rnorm(10, mean=60, sd=0.5))

A = targetLL(sta, rdist = 100)
print(A)


sta=list( lat=rnorm(10, mean=-30, sd=0.5),
lon = rnorm(10, mean=-40, sd=0.5))

A = targetLL(sta, rdist = 100)
print(A)








