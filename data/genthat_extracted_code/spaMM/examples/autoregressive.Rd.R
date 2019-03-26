library(spaMM)


### Name: autoregressive
### Title: Fitting autoregressive models
### Aliases: autoregressive adjacency CAR AR1
### Keywords: models spatial ts

### ** Examples

##### AR1 random effect:
ts <- data.frame(lh=lh,time=seq(48)) ## using 'lh' data from stats package
HLCor(lh~1 +AR1(1|time), data=ts, ranPars=list(ARphi=0.5,lambda=0.25,phi=0.001))


##### CAR random effect:
data("scotlip")
# CAR by Laplace with 'outer' estimation of rho
if (spaMM.getOption("example_maxtime")>0.7) {          
  corrHLfit(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
          adjMatrix=Nmatrix,family=poisson(),data=scotlip,HLmethod="ML") 
}
if (spaMM.getOption("example_maxtime")>0.8) {          
  fitme(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
          adjMatrix=Nmatrix,family=poisson(),data=scotlip) 
}

# CAR by Laplace with 'inner' estimation of rho
HLCor(cases~I(prop.ag/10) +adjacency(1|gridcode)+offset(log(expec)),
          adjMatrix=Nmatrix,family=poisson(),data=scotlip,HLmethod="ML")



