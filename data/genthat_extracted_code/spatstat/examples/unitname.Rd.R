library(spatstat)


### Name: unitname
### Title: Name for Unit of Length
### Aliases: unitname unitname.dppm unitname.im unitname.kppm
###   unitname.minconfit unitname.owin unitname.ppp unitname.ppm
###   unitname.psp unitname.quad unitname.slrm unitname.tess unitname<-
###   unitname<-.dppm unitname<-.im unitname<-.kppm unitname<-.minconfit
###   unitname<-.owin unitname<-.ppp unitname<-.ppm unitname<-.psp
###   unitname<-.quad unitname<-.slrm unitname<-.tess
### Keywords: spatial manip

### ** Examples

  X <- runifpoint(20)

  # if the unit of length is 1 metre:
  unitname(X) <- c("metre", "metres")

  # if the unit of length is 6 inches:
  unitname(X) <- list("inch", "inches", 6)



