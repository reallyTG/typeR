library(POCRE)


### Name: pocrescreen
### Title: Screen Variables Using Penalized Orthogonal-Components
###   Regression (POCRE)
### Aliases: pocrescreen

### ** Examples

data(simdata)
xx <- simdata[,-1]
yy <- simdata[,1]

# Screen for 50 covariates
sidx <- pocrescreen(yy,xx,maxvar=50)

# Screen for 50 additional covariates besides the first 10
xinc <- 1:10
sidx <- pocrescreen(yy,xx,maxvar=50,x.include=xinc)
sidx <- c(xinc,sidx)



