library(RSEIS)


### Name: brune.search
### Title: Search for Brune fit to displacement spectrum
### Aliases: brune.search
### Keywords: misc

### ** Examples



data(CE1)

####   set frequency range for modeling
f1  <-  0.01
f2  <-  14.0

##  set up data and parameters
amp  <-   CE1$y
len2  <-  2*next2(length(amp))
a  <-  list(y=amp, dt=CE1$dt)

Spec  <- MTMdisp(a, f1=f1, f2=f2, len2=len2, PLOT=FALSE )
 
lspec  <-  Spec$displ

###  get initial estimate of parameters
xc  <-  get.corner(  Spec$f , lspec, dt, f1, f2, PLOT=FALSE)

jmod  <-  brune.search(Spec$f, lspec, f1, f2,
                 xc$omega0, xc$corn, xc$tstar0, 2.0)




