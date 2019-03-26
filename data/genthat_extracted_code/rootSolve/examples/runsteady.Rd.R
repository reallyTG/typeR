library(rootSolve)


### Name: runsteady
### Title: Dynamically runs a system of ordinary differential equations
###   (ODE) to steady-state
### Aliases: runsteady
### Keywords: math

### ** Examples

## =======================================================================
## A simple sediment biogeochemical model
## =======================================================================

model<-function(t, y, pars) {

with (as.list(c(y, pars)),{

  Min       = r*OM
  oxicmin   = Min*(O2/(O2+ks))
  anoxicmin = Min*(1-O2/(O2+ks))* SO4/(SO4+ks2)

  dOM  = Flux - oxicmin - anoxicmin
  dO2  = -oxicmin      -2*rox*HS*(O2/(O2+ks)) + D*(BO2-O2)
  dSO4 = -0.5*anoxicmin  +rox*HS*(O2/(O2+ks)) + D*(BSO4-SO4)
  dHS  = 0.5*anoxicmin   -rox*HS*(O2/(O2+ks)) + D*(BHS-HS)

  list(c(dOM, dO2, dSO4, dHS), SumS = SO4+HS)
})
}

# parameter values
pars <- c(D = 1, Flux = 100, r = 0.1, rox = 1,
          ks = 1, ks2 = 1, BO2 = 100, BSO4 = 10000, BHS = 0)
# initial conditions
y <- c(OM = 1, O2 = 1, SO4 = 1, HS = 1)

# direct iteration
print( system.time(
  ST <- stode(y = y, func = model, parms = pars, pos = TRUE)
))

print( system.time(
  ST2 <- runsteady(y = y, func = model, parms = pars, times = c(0, 1000))
))

print( system.time(
  ST3 <- runsteady(y = y, func = model, parms = pars, times = c(0, 1000), 
    jactype = "sparse")
))

rbind("Newton Raphson" = ST$y, "Runsteady" = ST2$y, "Run sparse" = ST3$y)



