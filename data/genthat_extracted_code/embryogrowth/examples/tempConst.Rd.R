library(embryogrowth)


### Name: tempConst
### Title: Timeseries of constant temperatures for nests
### Aliases: tempConst
### Keywords: datasets

### ** Examples

## Not run: 
##D library(embryogrowth)
##D # Same as:
##D # GenerateConstInc(durations = rep(104*60*24, 11),
##D # temperatures = 25:35,
##D # names = paste0("T",25:35))
##D data(tempConst)
##D tempConst_f <- FormatNests(tempConst)
##D 
##D data(nest)
##D formated <- FormatNests(nest)
##D x <- structure(c(109.683413821537, 614.969219372661, 306.386903812694, 
##D  229.003478775323), .Names = c("DHA", "DHH", "T12H", "Rho25"))
##D  
##D  # See the stages dataset examples for justification of M0 and rK
##D  
##D pfixed <- c(rK=1.208968)
##D resultNest_4p_SSM <- searchR(parameters=x, fixed.parameters=pfixed, 
##D 	temperatures=formated, derivate=dydt.Gompertz, M0=0.3470893, 
##D 	test=c(Mean=39.33, SD=1.92))
##D 	
##D plotR(result=resultNest_4p_SSM, show.hist = TRUE,
##D              ylim=c(0, 8), curves="ML quantiles")
##D 
##D # Now use the fited parameters from resultNest_4p_SSM with  
##D # the constant incubation temperatures:
##D 
##D plot(resultNest_4p_SSM, temperatures=tempConst_f,  
##D 	stopattest=TRUE, series="T30", xlim=c(0,50),  
##D 	ylimT=c(22, 32), test=c(Mean=39.33, SD=1.92), 
##D 	embryo.stages="Caretta caretta.SCL")
##D 	
##D plot(resultNest_4p_SSM, temperatures=tempConst_f,  
##D 	stopattest=TRUE, series="T25", xlim=c(0,120),  
##D 	ylimT=c(22, 32), test=c(Mean=39.33, SD=1.92), 
##D 	embryo.stages="Caretta caretta.SCL")
##D 	
## End(Not run)



