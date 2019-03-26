library(embryogrowth)


### Name: plot.NestsResult
### Title: Plot the embryo growth
### Aliases: plot.NestsResult

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(resultNest_4p_SSM4p)
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45), series=1,  
##D 	    SE=c(DHA=1.396525, DHH=4.101217, T12H=0.04330405, Rho25=1.00479), 
##D 	    CI = "SE", replicate.CI = 100, 
##D 	    embryo.stages="Caretta caretta.SCL")
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45), series=1, 
##D 	    CI = "Hessian", replicate.CI = 100, 
##D 	    embryo.stages="Caretta caretta.SCL")
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45), series=1,  
##D      resultmcmc = resultNest_mcmc_4p_SSM4p, 
##D 	    CI = "MCMC", replicate.CI = 100, 
##D      embryo.stages="Caretta caretta.SCL")
##D # to plot all the nest at the same time, use
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45),  
##D 	    series="all", show.fioritures=FALSE, add=TRUE, 
##D 	    embryo.stages="Caretta caretta.SCL")
##D # to use color different for series
##D plot(resultNest_4p_SSM4p, xlim=c(0,70), ylimT=c(22, 32), ylimS=c(0,45), add=TRUE, 
##D 	    series="all", show.fioritures=FALSE, col.S=c(rep("black", 5), rep("red", 6)), 
##D 	    embryo.stages="Caretta caretta.SCL")
##D 	    
##D # to plot all the temperature profiles
##D 
##D par(mar=c(4, 4, 1, 1))
##D plot(resultNest_4p_SSM4p$data[[1]][, 1]/60/24,
##D      resultNest_4p_SSM4p$data[[1]][, 2], bty="n", 
##D      las=1, xlab="Days of incubation", 
##D      ylab=expression("Temperatures in "*degree*"C"), 
##D      type="l", xlim=c(0,70),ylim=c(20, 35))
##D      
##D      for (i in 2:21) {
##D           par(new=TRUE)
##D           plot(resultNest_4p_SSM4p$data[[i]][, 1]/60/24,
##D           resultNest_4p_SSM4p$data[[i]][, 2], bty="n", 
##D           las=1, xlab="", ylab="", type="l", xlim=c(0,70),
##D           ylim=c(20, 35), axes = FALSE)
##D      }
## End(Not run)



