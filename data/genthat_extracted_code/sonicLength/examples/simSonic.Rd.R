library(sonicLength)


### Name: simSonic
### Title: Simulate Sonicated Data
### Aliases: simSonic
### Keywords: Distributions

### ** Examples


theta <- seq(0.5,20.5,by=0.5)
phi <- prop.table(1:10)
names(phi) <- paste( 1 , 51:60 )
res <- simSonic( theta, phi )
head(res)
tail(res)
summary(res)



