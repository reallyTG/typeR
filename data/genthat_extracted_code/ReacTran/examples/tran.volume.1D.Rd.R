library(ReacTran)


### Name: tran.volume.1D
### Title: 1-D, 2-D and 3-D Volumetric Advective-Diffusive Transport in an
###   Aquatic System
### Aliases: tran.volume.1D tran.volume.2D tran.volume.3D
### Keywords: utilities

### ** Examples


## =============================================================================
##  EXAMPLE : organic carbon (OC) decay in a widening estuary
## =============================================================================

# Two scenarios are simulated: the baseline includes only input 
# of organic matter upstream. The second scenario simulates the 
# input of an important side river half way the estuary.  

#====================#
# Model formulation  #
#====================#

river.model <- function (t = 0, OC, pars = NULL) {

  tran <- tran.volume.1D(C = OC, F.up = F.OC, F.lat = F.lat,
          Disp = Disp, flow = flow.up, flow.lat = flow.lat, 
          V = Volume, full.output = TRUE) 

  reac <- - k*OC
  return(list(dCdt = tran$dC + reac, Flow = tran$flow))
}

#======================#
# Parameter definition #
#======================#

# Initialising morphology estuary: 

nbox          <- 500     # number of grid cells
lengthEstuary <- 100000  # length of estuary [m]
BoxLength     <- lengthEstuary/nbox # [m]
Distance      <- seq(BoxLength/2, by = BoxLength, len =nbox) # [m]
Int.Distance  <- seq(0, by = BoxLength, len = (nbox+1))      # [m]

# Cross sectional area: sigmoid function of estuarine distance [m2]
CrossArea <- 4000 + 72000 * Distance^5 /(Distance^5+50000^5)

# Volume of boxes                          (m3)
Volume  <- CrossArea*BoxLength

# Transport coefficients
Disp    <- 1000   # m3/s, bulk dispersion coefficient
flow.up  <- 180    # m3/s, main river upstream inflow
flow.lat.0  <- 180    # m3/s, side river inflow

F.OC    <- 180               # input organic carbon [mol s-1]
F.lat.0 <- 180              # lateral input organic carbon [mol s-1]

k       <- 10/(365*24*3600)  # decay constant organic carbon [s-1]


#====================#
# Model solution     #
#====================#
#scenario 1: without lateral input
F.lat    <- rep(0, length.out = nbox)
flow.lat <- rep(0, length.out = nbox)

Conc1 <- steady.1D(runif(nbox), fun = river.model, nspec = 1, name = "OC")   

#scenario 2: with lateral input
F.lat <- F.lat.0 * dnorm(x =Distance/lengthEstuary,
                         mean = Distance[nbox/2]/lengthEstuary, 
                         sd = 1/20, log = FALSE)/nbox 
flow.lat <- flow.lat.0 * dnorm(x = Distance/lengthEstuary,
                               mean = Distance[nbox/2]/lengthEstuary, 
                               sd = 1/20, log = FALSE)/nbox 

Conc2 <- steady.1D(runif(nbox), fun = river.model, nspec = 1, name = "OC")   

#====================#
# Plotting output    #
#====================#
# use S3 plot method
plot(Conc1, Conc2, grid = Distance/1000, which = "OC", 
     mfrow = c(2, 1), lwd = 2, xlab = "distance [km]", 
     main = "Organic carbon decay in the estuary",
     ylab = "OC Concentration [mM]")
       
plot(Conc1, Conc2, grid = Int.Distance/1000, which = "Flow", 
     mfrow = NULL, lwd = 2, xlab = "distance [km]", 
     main = "Longitudinal change in the water flow rate",
     ylab = "Flow rate [m3 s-1]")  

legend ("topright", lty = 1:2, col = 1:2, lwd = 2,
        c("baseline", "+ side river input"))




