library(xoi)


### Name: fitStahl
### Title: Fit Stahl model
### Aliases: fitStahl
### Keywords: models

### ** Examples


data(bssbsb)
## Don't show: 
bssbsb <- bssbsb[,1:50]
## End(Don't show)

xoloc <- find.breaks(bssbsb, chr=1)
L <- attr(xoloc, "L")

# get MLE (limiting maximum iterations to 10, just for speed in this example)
## Not run: mle <- fitStahl(xoloc, L, nu=c(9, 12), control=list(maxit=10))
## Don't show: 
mle <- fitStahl(xoloc, L, nu=c(9, 12), control=list(maxit=2))
## End(Don't show)




