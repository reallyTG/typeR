library(phenology)


### Name: fitRMU_MHmcmc
### Title: Run the Metropolis-Hastings algorithm for RMU.data
### Aliases: fitRMU_MHmcmc

### ** Examples

## Not run: 
##D library("phenology")
##D RMU.names.AtlanticW <- data.frame(mean=c("Yalimapo.French.Guiana", 
##D                                          "Galibi.Suriname", 
##D                                          "Irakumpapy.French.Guiana"), 
##D                                  se=c("se_Yalimapo.French.Guiana", 
##D                                       "se_Galibi.Suriname", 
##D                                       "se_Irakumpapy.French.Guiana"))
##D data.AtlanticW <- data.frame(Year=c(1990:2000), 
##D       Yalimapo.French.Guiana=c(2076, 2765, 2890, 2678, NA, 
##D                                6542, 5678, 1243, NA, 1566, 1566),
##D       se_Yalimapo.French.Guiana=c(123.2, 27.7, 62.5, 126, NA, 
##D                                  230, 129, 167, NA, 145, 20),
##D       Galibi.Suriname=c(276, 275, 290, NA, 267, 
##D                        542, 678, NA, 243, 156, 123),
##D       se_Galibi.Suriname=c(22.3, 34.2, 23.2, NA, 23.2, 
##D                            4.3, 2.3, NA, 10.3, 10.1, 8.9),
##D       Irakumpapy.French.Guiana=c(1076, 1765, 1390, 1678, NA, 
##D                                3542, 2678, 243, NA, 566, 566),
##D       se_Irakumpapy.French.Guiana=c(23.2, 29.7, 22.5, 226, NA, 
##D                                  130, 29, 67, NA, 15, 20))
##D                            
##D cst <- fitRMU(RMU.data=data.AtlanticW, RMU.names=RMU.names.AtlanticW, 
##D                colname.year="Year", model.trend="Constant", 
##D                model.SD="Zero")
##D pMCMC <- fitRMU_MHmcmc_p(result=cst, accept=TRUE)
##D fitRMU_MCMC <- fitRMU_MHmcmc(result = cst, n.iter = 10000, 
##D parametersMCMC = pMCMC, n.chains = 1, n.adapt = 0, thin = 1, trace = FALSE)
## End(Not run)



