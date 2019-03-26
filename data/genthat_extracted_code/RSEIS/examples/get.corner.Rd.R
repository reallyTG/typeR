library(RSEIS)


### Name: get.corner
### Title: Get Corner Frequency: Linear Model
### Aliases: get.corner
### Keywords: misc hplot

### ** Examples


data(CE1)

##   set frequency range for modeling for this high frequency data
##   we use f2 = 50, but for volcano data should be f2<15

f1 <- 0.01
f2 <- 50.0  

##  set up data and parameters
amp <-  CE1$y
len2 <- 2*next2(length(amp))
a <- list(y=amp, dt=CE1$dt)

Spec <- MTMdisp(a, f1=f1, f2=f2, len2=len2, PLOT=FALSE )

lspec <- Spec$displ

###  get initial estimate of parameters
xc <- get.corner(  Spec$f , lspec, CE1$dt, f1, f2, PLOT=FALSE)






