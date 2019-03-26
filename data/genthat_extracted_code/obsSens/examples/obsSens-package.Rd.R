library(obsSens)


### Name: obsSens-package
### Title: Perform sensitivity analysis on observational studies to explore
###   possible effects of unmeasured (lurking) variables.
### Aliases: obsSens-package obsSens
### Keywords: package models regression survival

### ** Examples


# Recreate tables from above references

obsSensCCC( log(23.1), log(c(6.9, 77.7)), g0=c(2,6,10),
  p0=seq(0,.5,.1), p1=seq(0,1,.2) )

obsSensSCC( log(1.21), log(c(1.09,1.25)),
  p0=seq(0,.5,.1), p1=seq(0,1,.1), g0=3 )


obsSensCNN( log(1.14), log(c(1.10,1.18)),
  rho=c(0,.5, .75, .85, .9, .95, .98, .99),
  gamma=seq(0,1,.2), sdx=4.5 )




