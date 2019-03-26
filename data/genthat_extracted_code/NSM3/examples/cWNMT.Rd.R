library(NSM3)


### Name: cWNMT
### Title: Computes a critical value for the Wilcoxon, Nemenyi,
###   McDonald-Thompson R distribution.
### Aliases: cWNMT
### Keywords: Wilcoxon Nemenyi McDonald-Thompson

### ** Examples

##Hollander-Wolfe-Chicken Example 7.3 Rounding First Base
#cWNMT(.047, 3, 15)
cWNMT(.047, 3, 15,n.mc=5000)

##Chapter 7 Comment 26
#cWNMT(.083, 4, 2)
cWNMT(.083, 4, 2,n.mc=5000)



