library(embryogrowth)


### Name: lnLHS
### Title: Return -log likelihood of the data and the parameters
### Aliases: lnLHS

### ** Examples

## Not run: 
##D library(embryogrowth)
##D totalIncubation_Cc <- subset(DatabaseTSD, 
##D                              Species=="Caretta caretta" & 
##D                                Note != "Sinusoidal pattern" & 
##D                                !is.na(Total) & Total != 0)
##D 
##D par <- c(S.low=0.5, S.high=0.3, 
##D          P.low=25, deltaP=10, MaxHS=logit(0.8))
##D          
##D lnLHS(x=par, data=totalIncubation_Cc)
##D 
##D g <- fitHS(par=par, data=totalIncubation_Cc)
##D 
##D lnLHS(x=g$par, data=totalIncubation_Cc)
##D 
##D t <- seq(from=20, to=40, by=0.1)
##D CIq <- predict(g, temperature=t)
##D 
##D par(mar=c(4, 4, 1, 1), +0.4)
##D plot(x=t, 
##D      y=modelHS(x=g$par, temperature = t), 
##D      bty="n", las=1, type="n", ylim=c(0,1), xlim=c(20, 40), 
##D      xlab="Incubation temperature", ylab="Hatching success")
##D with(totalIncubation_Cc, points(x = Incubation.temperature, 
##D      y = Hatched/(Hatched+NotHatched), 
##D      col="red", pch=19))
##D lines(x = t, y=CIq["2.5%", ], lty=2)
##D lines(x = t, y=CIq["97.5%", ], lty=2)
##D lines(x = t, y=CIq["50%", ], lty=1)
## End(Not run)



