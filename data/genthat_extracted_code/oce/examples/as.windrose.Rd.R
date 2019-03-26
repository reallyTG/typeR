library(oce)


### Name: as.windrose
### Title: Create a Windrose Object
### Aliases: as.windrose

### ** Examples

library(oce)
xcomp <- rnorm(360) + 1
ycomp <- rnorm(360)
wr <- as.windrose(xcomp, ycomp)
summary(wr)
plot(wr)




