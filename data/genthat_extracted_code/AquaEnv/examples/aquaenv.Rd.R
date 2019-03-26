library(AquaEnv)


### Name: aquaenv
### Title: aquaenv
### Aliases: aquaenv
### Keywords: misc

### ** Examples
## Not run: 
##D ############################
##D # Minimal aquaenv definition
##D ############################
##D ae <- aquaenv(S=30, t=15)
##D ae$K_CO2
##D 
##D ae$Ksp_calcite
##D ae$Ksp_aragonite
##D 
##D ae <- aquaenv(S=30, t=15, p=10)
##D ae <- aquaenv(S=30, t=15, P=11)
##D ae <- aquaenv(S=30, t=15, d=100)
##D ae <- aquaenv(S=30, t=15, d=100, Pa=0.5)
##D ae$K_CO2
##D 
##D ae$Ksp_calcite
##D ae$Ksp_aragonite
##D 
##D ae
##D 
##D 
##D ########################################################
##D # Defining the complete aquaenv system in different ways
##D ########################################################
##D S      <- 30
##D t      <- 15
##D p      <- gauge_p(d=10)  # ~ p <- 0.1*10*1.01325
##D SumCO2 <- 0.0020
##D pH     <- 8
##D TA     <- 0.002140798
##D fCO2   <- 0.0005326744
##D CO2    <- 2.051946e-05
##D 
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH)
##D ae$TA
##D 
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA)
##D ae$pH
##D 
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, CO2=CO2)
##D ae$pH
##D 
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, fCO2=fCO2)
##D ae$pH
##D 
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, CO2=CO2, fCO2=fCO2)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, TA=TA)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, CO2=CO2)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, fCO2=fCO2)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA, CO2=CO2)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA, fCO2=fCO2)
##D 
##D 
##D ################################################################
##D # Cloning the aquaenv system: 1 to 1 and with different pH or TA
##D ################################################################
##D S      <- 30
##D t      <- 15
##D SumCO2 <- 0.0020
##D TA     <- 0.00214
##D 
##D 
##D ae <- aquaenv(S, t, SumCO2=SumCO2, TA=TA)
##D 
##D aeclone1 <- aquaenv(ae=ae)
##D 
##D pH <- 9
##D 
##D aeclone2 <- aquaenv(ae=ae, pH=pH)
##D 
##D TA <- 0.002
##D 
##D aeclone3 <- aquaenv(ae=ae, TA=TA)
##D 
##D ae$pH
##D aeclone1$pH
##D aeclone2$TA
##D aeclone3$pH
##D 
##D 
##D 
##D #########################################################################
##D # Vectors as input variables (only ONE input variable may be a vector)
##D # (with full output: including the Revelle factor and the DSA properties)
##D #########################################################################
##D SumCO2 <- 0.0020
##D pH     <- 8
##D 
##D S      <- 30
##D t      <- 1:15
##D p      <- gauge_p(10)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=t, xlab="T/(deg C)", newdevice=FALSE)
##D 
##D S  <- 1:30
##D t  <- 15
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=S, xlab="S", newdevice=FALSE)
##D 
##D S  <- 30
##D p  <- gauge_p(seq(1,1000, 100))
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, pH=pH, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=p, xlab="gauge pressure/bar", newdevice=FALSE)
##D 
##D 
##D 
##D TA <- 0.0023
##D 
##D S  <- 30
##D t  <- 1:15
##D d  <- gauge_p(10)
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=t, xlab="T/(deg C)", newdevice=FALSE)
##D 
##D S  <- 1:30
##D t  <- 15
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=S, xlab="S", newdevice=FALSE)
##D 
##D S  <- 30
##D p  <- gauge_p(seq(1,1000, 100))
##D ae <- aquaenv(S, t, p, SumCO2=SumCO2, TA=TA, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=p, xlab="gauge pressure/bar", newdevice=FALSE)
##D 
##D 
##D 
##D ##################################################################
##D # Calculating SumCO2 by giving a constant  pH&CO2, pH&fCO2, pH&TA,
##D # TA&CO2, or TA&fCO2
##D ##################################################################
##D fCO2   <- 0.0006952296
##D CO2    <- 2.678137e-05
##D pH     <- 7.888573
##D TA     <- 0.0021
##D 
##D S  <- 30
##D t  <- 15
##D p  <- gauge_p(10)
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, CO2=CO2, dsa=TRUE, revelle=TRUE)
##D ae$SumCO2
##D ae$revelle
##D ae$dTAdH
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, fCO2=fCO2)
##D ae$SumCO2
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, TA=TA)
##D ae$SumCO2
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, TA=TA, CO2=CO2)
##D ae$SumCO2
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, TA=TA, fCO2=fCO2)
##D ae$SumCO2
##D 
##D 
##D t  <- 1:15
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, CO2=CO2)
##D plot(ae, xval=t, xlab="T/(deg C)", mfrow=c(9,10), newdevice=FALSE)
##D 
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, CO2=CO2, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=t, xlab="T/(deg C)", newdevice=FALSE)
##D 
##D S  <- 1:30
##D t  <- 15
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, fCO2=fCO2, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=S, xlab="S", newdevice=FALSE)
##D 
##D S  <- 30
##D p  <- gauge_p(seq(1,1000, 100))
##D ae <- aquaenv(S, t, p, SumCO2=NULL, pH=pH, TA=TA, revelle=TRUE, dsa=TRUE)
##D plot(ae, xval=p, xlab="gauge pressure/bar", newdevice=FALSE)
##D 
## End(Not run)


