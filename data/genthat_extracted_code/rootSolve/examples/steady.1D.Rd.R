library(rootSolve)


### Name: steady.1D
### Title: Steady-state solver for multicomponent 1-D ordinary differential
###   equations
### Aliases: steady.1D
### Keywords: math

### ** Examples

## =======================================================================
##  EXAMPLE 1: BOD + O2                                
## =======================================================================
## Biochemical Oxygen Demand (BOD) and oxygen (O2) dynamics
## in a river

#==================#
# Model equations  #
#==================#
O2BOD <- function(t, state, pars) {

  BOD <- state[1:N]
  O2  <- state[(N+1):(2*N)]

# BOD dynamics
  FluxBOD <-  v * c(BOD_0, BOD)  # fluxes due to water transport
  FluxO2  <-  v * c(O2_0, O2)
  
  BODrate <- r*BOD*O2/(O2+10)  # 1-st order consumption, Monod in oxygen

#rate of change = flux gradient - consumption  + reaeration (O2)
  dBOD         <- -diff(FluxBOD)/dx  - BODrate
  dO2          <- -diff(FluxO2)/dx   - BODrate + p*(O2sat-O2)

  return(list(c(dBOD = dBOD, dO2 = dO2), BODrate = BODrate))

}    # END O2BOD
 
 
#==================#
# Model application#
#==================#
# parameters
dx      <- 100       # grid size, meters
v       <- 1e2       # velocity, m/day
x       <- seq(dx/2, 10000, by = dx)  # m, distance from river
N       <- length(x)
r       <- 0.1       # /day, first-order decay of BOD
p       <- 0.1       # /day, air-sea exchange rate
O2sat   <- 300       # mmol/m3 saturated oxygen conc
O2_0    <- 50        # mmol/m3 riverine oxygen conc
BOD_0   <- 1500      # mmol/m3 riverine BOD concentration

# initial guess:
state <- c(rep(200, N), rep(200, N))

# running the model
print(system.time(
 out   <- steady.1D (y = state, func = O2BOD, parms = NULL,
                     nspec = 2, pos = TRUE, names = c("BOD", "O2"))))

#==================#
# Plotting output  #
#==================#
mf <- par(mfrow = c(2, 2))
plot(x, out$y[ ,"O2"], xlab =  "Distance from river",
     ylab = "mmol/m3", main = "Oxygen", type = "l")

plot(x, out$y[ ,"BOD"], xlab = "Distance from river",
     ylab = "mmol/m3", main = "BOD", type = "l")

plot(x, out$BODrate, xlab = "Distance from river",
     ylab = "mmol/m3/d", main = "BOD decay rate", type = "l")
par(mfrow=mf)

# same plot in one command
plot(out, which = c("O2","BOD","BODrate"),xlab = "Distance from river",
     ylab = c("mmol/m3","mmol/m3","mmol/m3/d"), 
     main = c("Oxygen","BOD","BOD decay rate"), type = "l")

# same, but now running dynamically to steady-state
print(system.time(
out2 <- steady.1D (y = state, func = O2BOD, parms = NULL, nspec = 2,
                   time = c(0, 1000), method = "runsteady", 
                   names = c("BOD", "O2"))))
                    
# plot all state variables at once, against "x":
plot(out2, grid=x, xlab = "Distance from river",
     ylab = "mmol/m3", type = "l", lwd = 2)
                         
plot(out, out2, grid=x, xlab = "Distance from river", which = "BODrate",
     ylab = "mmol/m3", type = "l", lwd = 2)

## =======================================================================
##   EXAMPLE 2: Silicate diagenesis                      
## =======================================================================
## Example from the book:
## Soetaert and Herman (2009).
## a practical guide to ecological modelling -
## using R as a simulation platform.
## Springer

#====================#
# Model equations    #
#====================#

SiDIAmodel <- function (time = 0,    # time, not used here
                        Conc,        # concentrations: BSi, DSi
                        parms = NULL) # parameter values; not used
{
 BSi<- Conc[1:N]
 DSi<- Conc[(N+1):(2*N)]

# transport           
# diffusive fluxes at upper interface of each layer

# upper concentration imposed (bwDSi), lower: zero gradient
 DSiFlux <- -SedDisp *   IntPor *diff(c(bwDSi ,DSi,DSi[N]))/thick    
 BSiFlux <- -Db      *(1-IntPor)*diff(c(BSi[1],BSi,BSi[N]))/thick 

 BSiFlux[1] <- BSidepo                # upper boundary flux is imposed

# BSi dissolution     
 Dissolution <- rDissSi * BSi*(1.- DSi/EquilSi )^pow 
 Dissolution <- pmax(0,Dissolution)

# Rate of change= Flux gradient, corrected for porosity + dissolution
 dDSi     <- -diff(DSiFlux)/thick/Porosity      +    # transport
              Dissolution * (1-Porosity)/Porosity    # biogeochemistry

 dBSi     <- -diff(BSiFlux)/thick/(1-Porosity)  - Dissolution				

 return(list(c(dBSi, dDSi),           # Rates of changes
        Dissolution = Dissolution,    # Profile of dissolution rates
        DSiSurfFlux = DSiFlux[1],     # DSi sediment-water exchange rate 
        DSIDeepFlux = DSiFlux[N+1],   # DSi deep-water (burial) flux
        BSiDeepFlux = BSiFlux[N+1]))  # BSi deep-water (burial) flux
}

#====================#
# Model run          #
#====================#
# sediment parameters
thick    <- 0.1                       # thickness of sediment layers (cm)
Intdepth <- seq(0, 10, by = thick)    # depth at upper interface of layers
Nint     <- length(Intdepth)          # number of interfaces
Depth    <- 0.5*(Intdepth[-Nint] +Intdepth[-1]) # depth at middle of layers
N        <- length(Depth)                       # number of layers

por0    <- 0.9                         # surface porosity (-)
pordeep <- 0.7                         # deep porosity    (-)
porcoef <- 2                           # porosity decay coefficient  (/cm)
# porosity profile, middle of layers
Porosity <- pordeep + (por0-pordeep)*exp(-Depth*porcoef)    
# porosity profile, upper interface 
IntPor   <- pordeep + (por0-pordeep)*exp(-Intdepth*porcoef)  

dB0      <- 1/365           # cm2/day      - bioturbation coefficient
dBcoeff  <- 2
mixdepth <- 5               # cm
Db       <- pmin(dB0, dB0*exp(-(Intdepth-mixdepth)*dBcoeff))

# biogeochemical parameters
SedDisp  <- 0.4             # diffusion coefficient, cm2/d
rDissSi  <- 0.005           # dissolution rate, /day
EquilSi  <- 800             # equilibrium concentration
pow      <- 1
BSidepo  <- 0.2*100         # nmol/cm2/day
bwDSi    <- 150             # mmol/m3

# initial guess of state variables-just random numbers between 0,1
Conc     <- runif(2*N)

# three runs with different deposition rates                                      
BSidepo  <- 0.2*100          # nmol/cm2/day
sol  <- steady.1D (Conc, func = SiDIAmodel, parms = NULL, nspec = 2, 
                   names = c("DSi", "BSi"))

BSidepo  <- 2*100          # nmol/cm2/day
sol2 <- steady.1D (Conc, func = SiDIAmodel, parms = NULL, nspec = 2, 
                   names = c("DSi", "BSi"))

BSidepo  <- 3*100          # nmol/cm2/day
sol3 <- steady.1D (Conc, func = SiDIAmodel, parms = NULL, nspec = 2, 
                   names = c("DSi", "BSi"))

#====================#
# plotting output    #
#====================#
par(mfrow=c(2,2))

# Plot 3 runs 
plot(sol, sol2, sol3, xyswap = TRUE, mfrow = c(2, 2),
     xlab = c("mmolSi/m3 liquid", "mmolSi/m3 solid"), 
     ylab = "Depth", lwd = 2, lty = 1)
legend("bottom", c("0.2", "2", "3"), title = "mmol/m2/d",
       lwd = 2, col = 1:3)
plot(Porosity, Depth, ylim = c(10, 0), xlab = "-" ,
     main = "Porosity",    type = "l", lwd = 2)
plot(Db, Intdepth, ylim = c(10, 0), xlab = "cm2/d",
     main = "Bioturbation", type = "l", lwd = 2)
mtext(outer = TRUE, side = 3, line = -2, cex = 1.5, "SiDIAmodel")

# similar, but shorter
plot(sol, sol2, sol3, vertical =TRUE,
     lwd = 2, lty = 1,
     main = c("DSi [mmol/m3 liq]","BSi [mmol/m3 sol]"),
     ylab= "depth [cm]")
legend("bottom", c("0.2", "2", "3"), title = "mmol/m2/d",
       lwd = 2, col = 1:3)





