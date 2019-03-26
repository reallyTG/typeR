library(evd)


### Name: profile2d.evd
### Title: Method for Profiling EVD Objects
### Aliases: profile2d profile2d.evd
### Keywords: models

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
M1 <- fgev(uvdata)
## Not run: M1P <- profile(M1)
## Not run: M1JP <- profile2d(M1, M1P, which = c("scale", "shape"))
## Not run: plot(M1JP)



