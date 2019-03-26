library(spatstat)


### Name: as.layered
### Title: Convert Data To Layered Object
### Aliases: as.layered as.layered.default as.layered.ppp
###   as.layered.splitppp as.layered.solist as.layered.listof
###   as.layered.msr
### Keywords: spatial manip

### ** Examples

   as.layered(cells)
   as.layered(amacrine)

   P <- rpoispp(100)
   fit <- ppm(P ~ x+y)
   rs <- residuals(fit, type="score")
   as.layered(rs)



