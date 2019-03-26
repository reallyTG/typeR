library(NSM3)


### Name: cFrd
### Title: Computes a critical value for the Friedman, Kendall-Babington
###   Smith S distribution.
### Aliases: cFrd
### Keywords: Friedman Kendall-Babington Smith

### ** Examples

##Hollander-Wolfe-Chicken Example 7.1 Rounding First Base
#cFrd(0.01,3,22,"Exact")
cFrd(0.01,3,22,n.mc=5000)
cFrd(0.01,3,22,"Asymptotic")



