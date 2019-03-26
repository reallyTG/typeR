library(GD)


### Name: stra
### Title: Converts discretized data to strata variables.
### Aliases: stra

### ** Examples

stra(rnorm(100,0,2), c(-4.9,-1.3,-0.5,0.3,0.9,2.0,4.9))
stra(c(1:10,15:20,5:30,10:25), c(1,7,13,18,23,30))
ds1 <- disc(ndvi_40$Tempchange, 4)
stv1 <- stra(ndvi_40$Tempchange, ds1$itv)




