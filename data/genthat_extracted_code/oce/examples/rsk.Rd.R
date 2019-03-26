library(oce)


### Name: rsk
### Title: Sample Rsk Dataset
### Aliases: rsk

### ** Examples

library(oce)
data(rsk)
## The object doesn't "know" it is CTD until told so
plot(rsk)
plot(as.ctd(rsk))




