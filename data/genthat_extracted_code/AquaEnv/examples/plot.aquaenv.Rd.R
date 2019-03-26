library(AquaEnv)


### Name: plot.aquaenv
### Title: plot.aquaenv
### Aliases: plot.aquaenv
### Keywords: misc

### ** Examples
## Not run: 
##D ### 0
##D #####
##D A <- aquaenv(35, 15, SumCO2=0.003, TA=seq(0.001,0.004, 0.0001))
##D plot(A, xval=A$TA, xlab="[TA]/(mol/kg-soln)")
##D plot(A, what=c("CO2", "HCO3", "CO3"), bjerrum=TRUE, log=TRUE)
##D plot(A, xval=A$TA, xlab="[TA]/(mol/kg-soln)", what=c("CO2", "HCO3", "CO3"),
##D      cumulative=TRUE, ylab="mol/kg-soln", ylim=c(0,0.0031))
##D 
##D 
##D ### 1
##D #####
##D 
##D SumCO2 <- 0.0020
##D pH     <- 8
##D 
##D S      <- 30
##D t      <- 1:15
##D p      <- 10
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=t, xlab="T/(deg C)", newdevice=FALSE)
##D 
##D 
##D 
##D ### 2
##D #####
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
##D      size=size, mfrow=mfrow, newdevice=FALSE)
##D 
##D 
##D # bjerrum plots
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
##D plot(ae, what=what, bjerrum=TRUE, log=TRUE, newdevice=FALSE)
##D plot(ae, what=what, bjerrum=TRUE, log=TRUE, ylim=c(-6,-1),
##D      legendinset=0, lwd=3, palette=c(1,3,4,5,6,colors()[seq(100,250,6)]))
##D 
##D 
##D ### 3
##D #####
##D parameters <- list(             
##D     t           = 15        , # degrees C
##D     S           = 35        , # psu       
##D 
##D     SumCO2_t0   = 0.002     , # mol/kg-soln  (comparable to Wang2005)
##D     TA_t0       = 0.0022    , # mol/kg-soln  (comparable to Millero1998)
##D 
##D     kc          = 0.5       , # 1/d	         proportionality factor
##D                               #                  for air-water exchange
##D     kp          = 0.000001  , # mol/(kg-soln*d)	 max rate of calcium
##D                               #                  carbonate precipitation
##D     n           = 2.0       , # -                exponent for kinetic
##D                               #                  rate law of precipitation
##D  
##D     modeltime   = 20        , # d              duration of the model
##D     outputsteps = 100         #                number of outputsteps
##D                    )
##D 
##D boxmodel <- function(timestep, currentstate, parameters)
##D {
##D   with (
##D         as.list(c(currentstate,parameters)),
##D         {        
##D           ae    <- aquaenv(S=S, t=t, SumCO2=SumCO2, pH=-log10(H), SumSiOH4=0, 
##D                            SumBOH3=0, SumH2SO4=0, SumHF=0, dsa=TRUE)
##D                    
##D           Rc    <- kc * ((ae$CO2_sat) - (ae$CO2)) 
##D           Rp    <- kp * (1-ae$omega_calcite)^n               
##D 
##D           dSumCO2 <- Rc - Rp
##D 
##D           dHRc    <- (      -(ae$dTAdSumCO2*Rc   ))/ae$dTAdH
##D           dHRp    <- (-2*Rp -(ae$dTAdSumCO2*(-Rp)))/ae$dTAdH
##D           dH      <- dHRc + dHRp
##D           
##D           ratesofchanges <- c(dSumCO2, dH)
##D           
##D           processrates   <- c(Rc=Rc, Rp=Rp)
##D           outputvars     <- c(dHRc=dHRc, dHRp=dHRp)
##D           
##D           return(list(ratesofchanges, list(processrates, outputvars, ae)))
##D         }
##D         )
##D }
##D 
##D with (as.list(parameters),
##D       {
##D         aetmp <- aquaenv(S=S, t=t, SumCO2=SumCO2_t0,
##D                          TA=TA_t0, SumSiOH4=0, SumBOH3=0,
##D                          SumH2SO4=0, SumHF=0)
##D         H_t0  <- 10^(-aetmp$pH)
##D         
##D         initialstate <<- c(SumCO2=SumCO2_t0, H=H_t0)
##D         times        <<- seq(0,modeltime,(modeltime/outputsteps))       
##D         output       <<- as.data.frame(vode(initialstate,times,
##D                                     boxmodel,parameters, hmax=1))
##D       })
##D 
##D what   <- c("SumCO2", "TA", "Rc", "Rp",
##D             "omega_calcite", "pH", "dHRc", "dHRp")
##D plot(aquaenv(ae=output, from.data.frame=TRUE), xval=output$time,
##D      xlab="time/d", mfrow=c(3,3), size=c(15,10), what=what) 
##D 
##D what <- c("dHRc", "dHRp")
##D plot(aquaenv(ae=output, from.data.frame=TRUE), xval=output$time,
##D      xlab="time/d", what=what, ylab="mol-H/(kg-soln*d)",
##D      legendposition="topright", cumulative=TRUE) 
## End(Not run)


