library(spatstat)


### Name: methods.lpp
### Title: Methods for Point Patterns on a Linear Network
### Aliases: methods.lpp as.ppp.lpp as.psp.lpp marks<-.lpp nsegments.lpp
###   print.lpp print.summary.lpp summary.lpp unitname.lpp unitname<-.lpp
###   unmark.lpp
### Keywords: spatial methods

### ** Examples

  X <- runiflpp(10, simplenet)
  unitname(X) <- c("furlong", "furlongs")
  X
  summary(X)
  summary(chicago)
  nsegments(X)
  Y <- as.ppp(X)



