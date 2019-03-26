library(NSM3)


### Name: pFrd
### Title: Function to compute the P-value for the observed Friedman,
###   Kendall-Babington Smith S statistic.
### Aliases: pFrd
### Keywords: Friedman Kendall-Babington Smith

### ** Examples

##Hollander-Wolfe-Chicken Example 7.1 Rounding First Base
rounding.times<-matrix(c(5.40, 5.50, 5.55,
                         5.85, 5.70, 5.75,
                         5.20, 5.60, 5.50,
                         5.55, 5.50, 5.40,
                         5.90, 5.85, 5.70,
                         5.45, 5.55, 5.60,
                         5.40, 5.40, 5.35,
                         5.45, 5.50, 5.35,
                         5.25, 5.15, 5.00,
                         5.85, 5.80, 5.70,
                         5.25, 5.20, 5.10,
                         5.65, 5.55, 5.45,
                         5.60, 5.35, 5.45,
                         5.05, 5.00, 4.95,
                         5.50, 5.50, 5.40,
                         5.45, 5.55, 5.50,
                         5.55, 5.55, 5.35,
                         5.45, 5.50, 5.55,
                         5.50, 5.45, 5.25,
                         5.65, 5.60, 5.40,
                         5.70, 5.65, 5.55,
                         6.30, 6.30, 6.25),ncol=3,byrow=TRUE)
#pFrd(rounding.times,n.mc=20000)
pFrd(rounding.times,n.mc=2000)



