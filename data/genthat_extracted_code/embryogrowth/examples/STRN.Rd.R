library(embryogrowth)


### Name: STRN
### Title: Estimate the parameters that best describe the sexualisation
###   thermal reaction norm within the TSP
### Aliases: STRN

### ** Examples

## Not run: 
##D library(embryogrowth)
##D MedIncubation_Cc <- subset(DatabaseTSD, Species=="Caretta caretta" & 
##D RMU=="Mediterranean" & Sexed!=0)
##D Med_Cc <- with(MedIncubation_Cc, tsd(males=Males, females=Females, 
##D  temperatures=Incubation.temperature, par=c(P=29.5, S=-0.01)))
##D plot(Med_Cc, xlim=c(25, 35))
##D males <- c(7, 0, 0, 0, 0, 5, 6, 3, 5, 3, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0)
##D names(males) <- rev(rev(names(resultNest_4p_SSM4p$data))[-(1:2)])
##D sexed <- rep(10, length(males))
##D names(sexed) <- rev(rev(names(resultNest_4p_SSM4p$data))[-(1:2)])
##D Initial_STRN <- resultNest_4p_SSM4p$par[c("DHA", "DHH", "T12H")]
##D Initial_STRN <- structure(c(582.567096666926, 2194.0806711639, 3475.28414940385), 
##D                           .Names = c("DHA", "DHH", "T12H"))
##D fp <- c(Rho25=100)
##D fitSTRN <- STRN(Initial_STRN=Initial_STRN, 
##D                 EmbryoGrowthTRN=resultNest_4p_SSM4p, tsd=Med_Cc, 
##D                 embryo.stages="Caretta caretta.SCL", 
##D                 Sexed=sexed, Males=males, 
##D                 fixed.parameters=fp, 
##D                 SE=TRUE, 
##D                 Temperatures="TSP.MassWeighted.STRNWeighted.temperature.mean")
##D plotR(fitSTRN, curves ="ML quantiles", ylim=c(0,2))
##D CTE <- info.nests(NestsResult=resultNest_4p_SSM4p, 
##D                   SexualisationTRN=fitSTRN,
##D                   SexualisationTRN.CI="Hessian",
##D                   embryo.stages="Caretta caretta.SCL", 
##D                   CI="Hessian", 
##D                   replicate.CI=100, 
##D                   progress=TRUE, 
##D                   warnings=TRUE, 
##D                   out="summary")$summary
##D # CTE with growth-weighted temperature average
##D plot(Med_Cc, xlim=c(25, 35))
##D points(x=CTE$TSP.MassWeighted.temperature.mean, y=males/sexed, 
##D          col="red", pch=19)
##D legend("topright", legend=c("CTE with growth-weighted TRN"), 
##D          pch=19, col=c("red"))
##D # CTE with sexualisation TRN and growth-weighted temperature average
##D plot(Med_Cc, xlim=c(25, 35))
##D points(x=CTE$TSP.MassWeighted.STRNWeighted.temperature.mean, y=males/sexed, 
##D          col="red", pch=19)
##D legend("topright", legend=c("CTE with growth-weighted TRN and Sex. TRN"), 
##D        pch=19, col=c("red"))
##D xx <- seq(from=20, to=35, by=0.1)
##D plot(x=xx, 
##D          y=log10(getFromNamespace(".SSM", ns="embryogrowth")(xx, 
##D                             c(fitSTRN$par, fitSTRN$fixed.parameters))[[1]]), 
##D          type="l", bty="n", xlim=c(20, 35), ylim=c(-20, 20), 
##D          xlab="Temperature", ylab="Sexualisation thermal reaction norm (log10)")
##D          
##D # Using only the sexualisation thermal reaction norm within TSP to calculate CTE
##D 
##D Initial_STRN <- resultNest_4p_SSM4p$par[c("DHA", "DHH", "T12H")]
##D Initial_STRN <- structure(c(3678.94960547096, -301.436485427701, 912.595953854977), 
##D                           .Names = c("DHA", "DHH", "T12H"))
##D fp <- c(Rho25=100)
##D fitSTRN_2 <- STRN(Initial_STRN=Initial_STRN, 
##D                 EmbryoGrowthTRN=resultNest_4p_SSM4p, tsd=Med_Cc, 
##D                 embryo.stages="Caretta caretta.SCL", 
##D                 Sexed=sexed, Males=males, 
##D                 fixed.parameters=fp,  
##D                 Temperatures="TSP.STRNWeighted.temperature.mean")
##D CTE <- info.nests(NestsResult=resultNest_4p_SSM4p, 
##D                   SexualisationTRN=fitSTRN_2,
##D                   SexualisationTRN.CI="Hessian",
##D                   embryo.stages="Caretta caretta.SCL", 
##D                   CI="Hessian", 
##D                   replicate.CI=100, 
##D                   progress=TRUE, 
##D                   warnings=TRUE, 
##D                   out="summary")$summary
##D # CTE with sexualisation TRN
##D plot(Med_Cc, xlim=c(25, 35))
##D points(x=CTE$TSP.STRNWeighted.temperature.mean, y=males/sexed, 
##D          col="red", pch=19)
##D legend("topright", legend=c("CTE with Sexualisation TRN"), 
##D        pch=19, col=c("red"))
##D xx <- seq(from=20, to=35, by=0.1)
##D plot(x=xx, 
##D          y=getFromNamespace(".SSM", ns="embryogrowth")(xx, 
##D                             c(fitSTRN$par, fitSTRN$fixed.parameters))[[1]], 
##D          type="l", bty="n", xlim=c(20, 35), ylim=c(0, 1E-18), 
##D          xlab="Temperature", ylab="Sexualisation thermal reaction norm")
## End(Not run)



