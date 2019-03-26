library(RandomFields)


### Name: RFinterpolate
### Title: Interpolation methods
### Aliases: RFinterpolate kriging
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show) 
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Preparation of graphics
dev.new(height=7, width=16) 

## creating random variables first
## here, a grid is chosen, but does not matter
p <- 3:8
points <- as.matrix(expand.grid(p,p))
model <- RMexp() + RMtrend(mean=1)
dta <- RFsimulate(model, x=points)
plot(dta)
x <- seq(0, 9, 0.25)
## Don't show: 
if (!interactive()) x <- seq(0, 5, 1.2)
## End(Don't show)

## Simple kriging with the exponential covariance model
model <- RMexp()
z <- RFinterpolate(model, x=x, y=x, data=dta)
plot(z, dta)

## Simple kriging with mean=4 and scaled covariance
model <- RMexp(scale=2) + RMtrend(mean=4)
z <- RFinterpolate(model, x=x, y=x, data=dta)
plot(z, dta)

## Ordinary kriging
model <- RMexp() + RMtrend(mean=NA)
z <- RFinterpolate(model, x=x, y=x, data=dta)
plot(z, dta)



## Co-Kriging
n <- 100
x <- runif(n=n, min=1, max=50)
y <- runif(n=n, min=1, max=50)
## Don't show: 
if (!interactive()) n <- 2
## End(Don't show)


rho <- matrix(nc=2, c(1, -0.8, -0.8, 1))
model <- RMparswmX(nudiag=c(0.5, 0.5), rho=rho)

## generation of artifical data
data <- RFsimulate(model = model, x=x, y=y, grid=FALSE)
## introducing some NAs ...
print(data)
len <- length(data)
data@data$variable1[1:(len / 10)] <- NA
data@data$variable2[len - (0:len / 100)] <- NA
print(data)
plot(data)

## co-kriging
x <- y <- seq(0, 50, 1)
## Don't show: 
if (!interactive()) x <- y <- seq(0, 5, 1)
## End(Don't show)
k <- RFinterpolate(model, x=x, y=y, data= data)
plot(k, data)

## conditional simulation
z <- RFsimulate(model, x=x, y=y, data= data) ## takes some time
plot(z, data)



## Don't show: ## Not run: 
##D 
##D ## alternatively 
##D 
##D ## Intrinsic kriging
##D model <- RMfbm(a=1)
##D z <- RFinterpolate(krige.meth="U", model, x, x, data=dta)
##D screen(scr <- scr+1); plot(z, dta)
##D 
##D 
##D ## Interpolation nicht korrekt
##D ## Intrinsic kriging with Polynomial Trend
##D model <- RMfbm(a=1) + RMtrend(polydeg=2)
##D z <- RFinterpolate(model, x, x, data=dta)
##D screen(scr <- scr+1); plot(z, dta)
## End(Not run)## End(Don't show)

## Don't show: ## Not run: 
##D ## Universal kriging with trend as formula
##D model <- RMexp() + RMtrend(arbit=function(X1,X2) sin(X1+X2)) +
##D  RMtrend(mean=1)
##D z <- RFinterpolate(model, x=x, y=x, data=dta)
##D screen(scr <- scr+1); plot(z, dta)
##D 
##D ## Universal kriging with several arbitrary functions
##D model <- RMexp() + RMtrend(arbit=function(x,y) x^2 + y^2) +
##D  RMtrend(arbit=function(x,y) (x^2 + y^2)^0.5) + RMtrend(mean=1)
##D z <- RFinterpolate(model, x=x, y=x, data=dta)
##D screen(scr <- scr+1); plot(z, dta)
## End(Not run)## End(Don't show)

close.screen(all = TRUE)

## Don't show: 
while (length(dev.list()) >= 2) dev.off()
## End(Don't show)
## Don't show: 
FinalizeExample()
## End(Don't show)


