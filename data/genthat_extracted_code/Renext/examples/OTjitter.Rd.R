library(Renext)


### Name: OTjitter
### Title: Add a small amount of noise to a numeric vector
### Aliases: OTjitter

### ** Examples

## Garonne data (heavily rounded)
x <- Garonne$OTdata$Flow
min(x) 
xmod <- OTjitter(x, threshold = 2500)
length(x)
nlevels(as.factor(x))
nlevels(as.factor(xmod))
max(abs(x-xmod))



