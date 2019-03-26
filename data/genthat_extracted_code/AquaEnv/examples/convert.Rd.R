library(AquaEnv)


### Name: convert
### Title: convert
### Aliases: convert
### Keywords: misc

### ** Examples
## Not run: 
##D ### 1
##D #####
##D 
##D t <- 15
##D S  <- 10
##D 
##D pH_NBS      <- 8.142777
##D SumCO2molar <- 0.002016803
##D 
##D pH_free     <- convert(pH_NBS,      "pHscale", "nbs2free",    S=S, t=t)
##D SumCO2molin <- convert(SumCO2molar, "conc",    "molar2molin", S=S, t=t)
##D 
##D ae <- aquaenv(S, t, SumCO2=SumCO2molin, pH=pH_free)
##D ae$pH
##D ae$SumCO2
##D 
##D 
##D 
##D ### 2
##D #####
##D ae <- aquaenv(30,10)
##D ae$SumBOH3
##D ae <- convert(ae, "mol/kg-soln", "umol/kg-H2O", 1e6/ae$molal2molin, "unit")
##D ae$SumBOH3
##D 
## End(Not run)


