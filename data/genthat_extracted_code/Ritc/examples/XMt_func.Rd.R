library(Ritc)


### Name: XMt_func
### Title: Calculation of concentrations of reaction components in ITC cell
###   after each injection
### Aliases: XMt_func
### Keywords: Isothermal Titration Calorimetry (ITC)

### ** Examples

a <- list(P0=0.01, L0=0, Asyr=0.2, V0=1.4195);

injv <- rep(10,30);

dh2 <- XMt_func(stapar=a, injV0=injv);



