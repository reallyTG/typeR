library(sfsmisc)


### Name: tkdensity
### Title: GUI Density Estimation using Tcl/Tk
### Aliases: tkdensity
### Keywords: hplot dynamic

### ** Examples

if (dev.interactive(TRUE)) ## does really not make sense otherwise
 if(try(require("tcltk"))) { ## sometimes (rarely) there, but broken

  data(faithful)
  tkdensity(faithful $ eruptions)

  set.seed(7)
  if(require("nor1mix"))
     tkdensity(rnorMix(1000, MW.nm9), kernels = c("gaussian", "epanechnikov"))
 }



