library(madness)


### Name: as.madness
### Title: Coerce to a madness object.
### Aliases: as.madness as.madness.default as.madness

### ** Examples

xy <- data.frame(x=rnorm(100),y=runif(100),z=runif(100))
amod <- lm(z ~ x + y,xy)
amad <- as.madness(amod)



