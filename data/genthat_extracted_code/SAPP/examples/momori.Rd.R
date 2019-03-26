library(SAPP)


### Name: momori
### Title: Maximum Likelihood Estimates of Parameters in the Omori-Utsu
###   (Modified Omori) Formula
### Aliases: momori
### Keywords: spatial

### ** Examples

data(main2003JUL26)  # The aftershock data of 26th July 2003 earthquake of M6.2 
x <- main2003JUL26
momori(x$time, x$magnitude, 2.5, 0.01, 18.68,
       c(0,0.96021E+02,0.58563E-01,0.96611E+00))



