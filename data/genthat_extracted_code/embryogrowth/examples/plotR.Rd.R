library(embryogrowth)


### Name: plotR
### Title: Show the fitted growth rate dependent on temperature and its
###   density
### Aliases: plotR

### ** Examples

## Not run: 
##D library(embryogrowth)
##D plotR(result = resultNest_4p_SSM4p, 
##D              resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              curves = "MCMC quantiles")
##D #################
##D plotR(resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              curves = "MCMC quantiles", show.density=TRUE)
##D #################
##D plotR(resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              curves = "MCMC quantiles", polygon=TRUE)
##D #################
##D plotR(resultmcmc=resultNest_mcmc_6p_SSM6p, ylim=c(0,4), 
##D       curves = "MCMC quantiles", polygon=TRUE, col.polygon = rgb(0, 1, 0, 1))
##D plotR(resultmcmc=resultNest_mcmc_4p_SSM4p,
##D        curves = "MCMC quantiles", polygon=TRUE, col.polygon = rgb(1, 0, 0, 0.5), new=FALSE)
##D legend("topleft", legend=c("SSM 4 parameters", "SSM 6 parameters"), 
##D         pch=c(15, 15), col=c(rgb(1, 0, 0, 0.5), rgb(0, 1, 0, 1)))
##D #################
##D sy <- plotR(resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              curves = "MCMC quantiles", show.density=FALSE)
##D plotR(resultmcmc=resultNest_mcmc_6p_SSM6p, col="red",
##D              curves = "MCMC quantiles", show.density=FALSE, 
##D              new=FALSE, scaleY=sy)
##D #################
##D sy <- plotR(result=resultNest_6p_SSM6p, curves="ML", 
##D              show.hist = TRUE, new = TRUE)
##D plotR(result=resultNest_4p_SSM4p, curves="ML", scaleY=sy, 
##D              show.hist = FALSE, new = FALSE, col="red")
##D #################
##D plotR(result=resultNest_6p_SSM6p, curves="ML", 
##D              show.hist = TRUE, ylimH=c(0,1), atH=c(0, 0.1, 0.2))
##D ################
##D plotR(result = resultNest_4p_SSM4p, 
##D              resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              show.density = TRUE, 
##D              curves = "MCMC quantiles")
##D #################
##D plotR(result=resultNest_4p_SSM4p, 
##D              ylim=c(0, 4), curves="ML quantiles", scaleY=1E5)
##D #################             
##D plotR(result=resultNest_4p_SSM4p, show.hist = TRUE,
##D              ylim=c(0, 4), curves="ML quantiles", scaleY=1E5)
##D #################
##D plotR(resultmcmc=resultNest_mcmc_4p_SSM4p, 
##D              ylim=c(0, 4), curves = "MCMC quantiles", show.density=TRUE, scaleY=1E5)
## End(Not run)



