library(AquaEnv)


### Name: titration
### Title: titration
### Aliases: titration
### Keywords: misc

### ** Examples
## Not run: 
##D ####################
##D # Titration with HCl
##D ####################
##D S <- 35
##D t <- 15
##D 
##D SumCO2 <- 0.003500
##D SumNH4 <- 0.000020
##D 
##D mass_sample  <- 0.01 # the mass of the sample solution in kg
##D mass_titrant <- 0.02 # the total mass of the added titrant solution in
##D                      # kg
##D conc_titrant <- 0.01 # the concentration of the titrant solution in
##D                      # mol/kg-soln
##D S_titrant    <- 0.5  # the salinity of the titrant solution (the
##D                      # salinity of a solution with a ionic strength of
##D                      # 0.01 according to: I = (19.924 S) / (1000 - 1.005S)
##D steps        <- 50   # the amount of steps the mass of titrant is added
##D                      # in
##D type         <- "HCl"
##D 
##D pHstart <- 11.3
##D 
##D 
##D ae <- titration(aquaenv(S=S, t=t, SumCO2=SumCO2, SumNH4=SumNH4,
##D                 pH=pHstart), mass_sample, mass_titrant, conc_titrant,
##D                 S_titrant, steps, type)
##D 
##D 
##D # plotting everything
##D plot(ae, xval=ae$delta_mass_titrant, xlab="HCl solution added [kg]",
##D mfrow=c(10,10))
##D 
##D 
##D # plotting selectively
##D size  <- c(12,8) #inches
##D mfrow <- c(4,4)
##D what  <- c("TA", "pH", "CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH",
##D            "NH4", "NH3", "H2SO4", "HSO4", "SO4", "HF", "F", "pCO2")
##D 
##D 
##D plot(ae, xval=ae$delta_mass_titrant, xlab="HCl solution added [kg]",
##D      what=what, size=size, mfrow=mfrow)
##D 
##D plot(ae, xval=ae$pH, xlab="free scale pH", what=what, size=size,
##D      mfrow=mfrow)
##D 
##D 
##D # different x values
##D plot(ae, xval=ae$delta_conc_titrant, xlab="[HCl] offset added
##D      [mol/kg-soln]", what=what, size=size, mfrow=mfrow)
##D 
##D plot(ae, xval=ae$delta_moles_titrant, xlab="HCl added [mol]", what=what,
##D      size=size, mfrow=mfrow)
##D 
##D 
##D # bjerrum plots
##D par(mfrow=c(1,1))
##D plot(ae, bjerrum=TRUE)
##D 
##D what  <- c("CO2", "HCO3", "CO3")
##D plot(ae, what=what, bjerrum=TRUE)
##D plot(ae, what=what, bjerrum=TRUE, lwd=4, palette=c("cyan", "magenta",
##D      "yellow"), bg="gray", legendinset=0.1, legendposition="topleft")
##D 
##D 
##D 
##D what  <- c("CO2", "HCO3", "CO3", "BOH3", "BOH4", "OH", "NH4", "NH3",
##D            "H2SO4", "HSO4", "SO4", "HF", "F")
##D 
##D plot(ae, what=what, bjerrum=TRUE, log=TRUE)
##D plot(ae, what=what, bjerrum=TRUE, log=TRUE, ylim=c(-6,-1),
##D      legendinset=0, lwd=3, palette=c(1,3,4,5,6,colors()[seq(100,250,6)]))
## End(Not run)


