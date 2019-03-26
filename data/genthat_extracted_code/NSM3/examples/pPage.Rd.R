library(NSM3)


### Name: pPage
### Title: Page
### Aliases: pPage
### Keywords: Page

### ** Examples

##Hollander-Wolfe-Chicken Example 7.2 Breaking Strength of Cotton Fibers
strength.index<-matrix(c(7.46, 7.68, 7.21, 7.17, 7.57, 7.80, 7.76, 7.73, 7.74, 8.14, 8.15,
7.87, 7.63, 8.00, 7.93),byrow=FALSE,ncol=5)

#pPage(strength.index,method="Exact")
pPage(strength.index,method="Monte Carlo")



