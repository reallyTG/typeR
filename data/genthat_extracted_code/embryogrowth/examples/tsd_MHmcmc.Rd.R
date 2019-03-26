library(embryogrowth)


### Name: tsd_MHmcmc
### Title: Metropolis-Hastings algorithm for Sex ratio
### Aliases: tsd_MHmcmc

### ** Examples

## Not run: 
##D library(embryogrowth)
##D eo <- subset(DatabaseTSD, Species=="Emys orbicularis", c("Males", "Females", 
##D                                        "Incubation.temperature"))
##D eo_logistic <- tsd(eo)
##D pMCMC <- tsd_MHmcmc_p(eo_logistic, accept=TRUE)
##D # Take care, it can be very long
##D result_mcmc_tsd <- tsd_MHmcmc(result=eo_logistic, 
##D 		parametersMCMC=pMCMC, n.iter=10000, n.chains = 1,  
##D 		n.adapt = 0, thin=1, trace=FALSE, adaptive=TRUE)
##D # summary() permits to get rapidly the standard errors for parameters
##D summary(result_mcmc_tsd)
##D plot(result_mcmc_tsd, parameters="S", scale.prior=TRUE, xlim=c(-3, 3), las=1)
##D plot(result_mcmc_tsd, parameters="P", scale.prior=TRUE, xlim=c(25, 35), las=1)
##D 1-rejectionRate(as.mcmc(result_mcmc_tsd))
##D raftery.diag(as.mcmc(result_mcmc_tsd))
##D heidel.diag(as.mcmc(result_mcmc_tsd))
##D library(car)
##D o <- P_TRT(x=eo_logistic, resultmcmc=result_mcmc_tsd)
##D outEo <- dataEllipse(x=o$P_TRT[, "PT"], 
##D                      y=o$P_TRT[, "TRT"], 
##D                      levels=c(0.95), 
##D                      draw=FALSE)
##D plot(x = o$P_TRT[, "PT"], 
##D      y=o$P_TRT[, "TRT"], 
##D      pch=".", las=1, bty="n", 
##D      xlab="Pivotal temperature", 
##D      ylab=paste0("TRT ", as.character(100*eo_logistic$l), "%"), 
##D      xlim=c(28.4, 28.6), 
##D      ylim=c(0.8, 1.8))
##D lines(outEo[, 1], outEo[, 2], col="green", lwd=2)
##D legend("topleft", legend = c("Emys orbicularis", "95% confidence ellipse"), 
##D        pch=c(19, NA), col=c("black", "green"), lty=c(0, 1), lwd=c(0, 2))
## End(Not run)



