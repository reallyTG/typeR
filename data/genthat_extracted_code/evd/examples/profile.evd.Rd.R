library(evd)


### Name: profile.evd
### Title: Method for Profiling EVD Objects
### Aliases: profile.evd
### Keywords: models

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
M1 <- fgev(uvdata)
## Not run: M1P <- profile(M1)
## Not run: par(mfrow = c(2,2))
## Not run: cint <- plot(M1P)
## Not run: cint



