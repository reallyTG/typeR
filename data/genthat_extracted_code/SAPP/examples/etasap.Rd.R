library(SAPP)


### Name: etasap
### Title: Maximum Likelihood Estimates of the ETAS Model
### Aliases: etasap
### Keywords: spatial

### ** Examples

data(main2003JUL26)  # The aftershock data of 26th July 2003 earthquake of M6.2 
x <- main2003JUL26
etasap(x$time, x$magnitude, 2.5, 6.2, 
       c(0, 0.63348E+02, 0.38209E-01, 0.26423E+01, 0.10169E+01),, 0.01, 18.68)



