library(TUWmodel)


### Name: TUWmodel
### Title: Lumped hydrological model developed at the Vienna University of
###   Technology for education purposes
### Aliases: TUWmodel hbvmodel
### Keywords: univar

### ** Examples

## Load the data
data(example_TUWmodel)


## Simulate runoff and plot observed vs simulated series
## Lumped case (weighted means of the inputs)
simLump <- TUWmodel(prec=apply(P_Vils, 1, weighted.mean, w=areas_Vils), 
                    airt=apply(T_Vils, 1, weighted.mean, w=areas_Vils),
                    ep=apply(PET_Vils, 1, weighted.mean, w=areas_Vils), 
                    area=sum(areas_Vils),
             param=c(1.02,1.70,2,0,-0.336,
                     0.934,121,2.52,
                     0.473,9.06,142,
                     50.1,2.38,10,25))

plot(as.Date(names(Q_Vils)), Q_Vils, type="l", xlab="", ylab="Discharges [mm/day]")
 lines(as.Date(rownames(T_Vils)), simLump$q, col=2)
legend("topleft", legend=c("Observations","Simulations"), col=c(1,2), lty=1, bty="n")

plot(as.Date(rownames(SWE_Vils)), apply(SWE_Vils, 1, weighted.mean, w=areas_Vils), 
     type="l", xlab="", ylab="Snow Water Equivalent [mm]")
 lines(as.Date(rownames(T_Vils)), simLump$swe, col=2)

## Distribute input case (6 zones)
simDist <- TUWmodel(prec=P_Vils, airt=T_Vils, ep=PET_Vils, area=areas_Vils/sum(areas_Vils),
             param=c(1.02,1.70,2,0,-0.336,
                     0.934,121,2.52, 
                     0.473,9.06,142,
                     50.1,2.38,10,25))

plot(as.Date(names(Q_Vils)), Q_Vils, type="l", xlab="", ylab="Discharges [mm/day]")
 lines(as.Date(rownames(T_Vils)), simDist$q, col=2)
legend("topleft", legend=c("Observations","Simulations"), col=c(1,2), lty=1, bty="n")

plot(as.Date(rownames(SWE_Vils)), apply(SWE_Vils, 1, weighted.mean, w=areas_Vils),
     type="l", xlab="", ylab="Snow Water Equivalent [mm]")
 lines(as.Date(rownames(T_Vils)), apply(simDist$swe, 1, weighted.mean, w=areas_Vils), col=2)

## Distributed input and parameters case
parametri <- matrix(rep(c(1.02,1.70,2,0,-0.336,
                          0.934,121,2.52,
                          0.473,9.06,142,
                          50.1,2.38,10,25), 6), ncol=6)
parametri[2,] <- c(1.4, 1.7, 1.9, 2.2, 2.4, 3.0)
simDist2 <- TUWmodel(prec=P_Vils,
                    airt=T_Vils, 
                    ep=PET_Vils, 
                    area=areas_Vils/sum(areas_Vils),
             param=parametri)

plot(as.Date(names(Q_Vils)), Q_Vils, type="l", xlab="", ylab="Discharges [mm/day]")
 lines(as.Date(rownames(T_Vils)), simDist2$q, col=2)
legend("topleft", legend=c("Observations","Simulations"), col=c(1,2), lty=1, bty="n")



