library(mistat)


### Name: mistat-package
### Title: The Modern Industrial Statistics Package
### Aliases: mistat-package mistat
### Keywords: package

### ** Examples

data(OELECT)
data(OELECT1)

randomizationTest(list(a=OELECT, b=OELECT1), 
                  R=500, calc=mean, 
                  fun=function(x) x[1]-x[2],
                  seed=123)

Ps <- pistonSimulation(
  m = rep(60, 100),
  s = rep(0.02, 100),
  v0 = rep(0.01, 100),
  k = rep(5000, 100),
  p0 = rep(110000, 100),
  t = c(rep(296,35), 296*1.1^(1:65)),
  t0 = rep(360, 100),
  each = 1, 
  seed = 123,
  check = FALSE)

head(Ps)

cusumArl(mean= 0.0, 
         N=100,  
         limit=5000,
         seed=123)

powerCircuitSimulation(seed=123, each=3)

set.seed(123)

Ttf <- rgamma(50, 
              shape=2, 
              scale=100)

Ttr <- rgamma(50, 
              shape=2, 
              scale=1)
              
AvailEbd <- availDis(ttf=Ttf,  
                     ttr=Ttr, 
                     n=1000, seed=123)


RenewEbd <- renewDis(ttf=Ttf, 
                     ttr=Ttr, 
                     time=1000, 
                     n=1000)



