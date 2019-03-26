library(Ritc)


### Name: itcONE11
### Title: Simulate an ITC reaction with one to one binding model
### Aliases: itcONE11
### Keywords: Isothermal Titration Calorimetry (ITC) Thermodynamics
###   Simulation

### ** Examples

a <- list(K = 1e7, DH = -23000, HD = 0.1, N = 0.9);

b <- list(P0 = 0.02, L0 = 0, Asyr = 0.2, V0 = 1.4195);

injv <- rep(10,30);

dh1 <- itcONE11(varpar=a, stapar=b, injV0=injv);



