library(fda)


### Name: CSTR
### Title: Continuously Stirred Tank Reactor
### Aliases: CSTR CSTR2in CSTR2 CSTRfn CSTRfitLS CSTRres CSTRsse
### Keywords: smooth

### ** Examples

###
###
### 1.  lsoda(y, times, func=CSTR2, parms=...)
###
###
#  The system of two nonlinear equations has five forcing or
#  input functions.
#  These equations are taken from
#  Marlin, T. E. (2000) Process Control, 2nd Edition, McGraw Hill,
#  pages 899-902.
##
##  Set up the problem
##
fitstruct <- list(V    = 1.0,#  volume in cubic meters
                  Cp   = 1.0,#  concentration in cal/(g.K)
                  rho  = 1.0,#  density in grams per cubic meter
                  delH = -130.0,# cal/kmol
                  Cpc  = 1.0,#  concentration in cal/(g.K)
                  rhoc = 1.0,#  cal/kmol
                  Tref = 350)#  reference temperature
#  store true values of known parameters
EoverRtru = 0.83301#   E/R in units K/1e4
kreftru   = 0.4610 #   reference value
atru      = 1.678#     a in units (cal/min)/K/1e6
btru      = 0.5#       dimensionless exponent

#% enter these parameter values into fitstruct

fitstruct[["kref"]]   = kreftru#
fitstruct[["EoverR"]] = EoverRtru#  kref = 0.4610
fitstruct[["a"]]      = atru#       a in units (cal/min)/K/1e6
fitstruct[["b"]]      = btru#       dimensionless exponent

Tlim  = 64#    reaction observed over interval [0, Tlim]
delta = 1/12#  observe every five seconds
tspan = seq(0, Tlim, delta)#

coolStepInput <- CSTR2in(tspan, 'all.cool.step')

#  set constants for ODE solver

#  cool condition solution
#  initial conditions

Cinit.cool = 1.5965#  initial concentration in kmol per cubic meter
Tinit.cool = 341.3754# initial temperature in deg K
yinit = c(Conc = Cinit.cool, Temp=Tinit.cool)

#  load cool input into fitstruct

fitstruct[["Tcin"]] = coolStepInput[, "Tcin"];

#  solve  differential equation with true parameter values

if (require(deSolve)) {
coolStepSoln <- lsoda(y=yinit, times=tspan, func=CSTR2,
  parms=list(fitstruct=fitstruct, condition='all.cool.step', Tlim=Tlim) )
}
###
###
### 2.  CSTRfn
###
###

# See the script in '~R\library\fda\scripts\CSTR\CSTR_demo.R'
#  for more examples.




