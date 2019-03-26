library(RandomFields)


### Name: RMmodelsMultivariate
### Title: Multivariate models
### Aliases: RMmodelsMultivariate 'Multivariate RMmodels'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show) 
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

n <- 100
x <- runif(n=n, min=1, max=50)
y <- runif(n=n, min=1, max=50)

rho <- matrix(nc=2, c(1, -0.8, -0.8, 1))
model <- RMparswmX(nudiag=c(0.5, 0.5), rho=rho)

## generation of artifical data
dta <- RFsimulate(model = model, x=x, y=y, grid=FALSE)
## Don't show: 
if (!interactive()) .dataorig <- dta
## End(Don't show)
## introducing some NAs ...
dta@data$variable1[1:10] <- NA
if (interactive()) dta@data$variable2[90:100] <- NA
## Don't show: 
if (!interactive()) {print("no NAs introduced"); dta <- .dataorig}
## End(Don't show)
plot(dta)

## co-kriging
x <- y <- seq(0, 50, 1)
## Don't show: 
if (!interactive()) x <- y <- seq(0, 5, 1)
## End(Don't show)
k <- RFinterpolate(model, x=x, y=y, data= dta)
plot(k, dta)

## conditional simulation
z <- RFsimulate(model, x=x, y=y, data= dta) ## takes a while
plot(z, dta)

## Don't show: 
FinalizeExample()
## End(Don't show)


