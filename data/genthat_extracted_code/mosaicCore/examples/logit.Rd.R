library(mosaicCore)


### Name: logit
### Title: Logit and inverse logit functions
### Aliases: logit ilogit

### ** Examples

p <- seq(.1, .9, by=.10)
l <- logit(p); l
ilogit(l)
ilogit(l) == p



