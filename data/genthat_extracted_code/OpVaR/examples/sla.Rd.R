library(OpVaR)


### Name: sla
### Title: Single-Loss Approximation for Operational Value at Risk
### Aliases: sla

### ** Examples

  ## Not run: 
##D   #Example: SLA for the spliced log-gamma gpd model (tail-index = 0.014, no interpolation required)
##D   opriskmodel = list()
##D   opriskmodel[[1]] = list()
##D   opriskmodel[[1]]$sevdist = buildSplicedSevdist("lgamma", c(1.23, 0.012), 
##D                                                  "gpd", c(200, 716, 0.014), 2000, 0.8)
##D   opriskmodel[[1]]$freqdist = buildFreqdist("pois", 50)
##D   
##D   #Example: SLA for the spliced log-gamma gpd model (tail-index = 0.9, interpolation performed)
##D   opriskmodel[[2]] = list()
##D   opriskmodel[[2]]$sevdist = buildSplicedSevdist("lgamma", c(1.23, 0.012), 
##D                                                  "gpd", c(200, 716, 0.9), 2000, 0.8)
##D   opriskmodel[[2]]$freqdist = buildFreqdist("pois", 50)
##D   
##D   sla(opriskmodel, alpha = 0.95) 
##D   
##D   #generate plot if interpolation was performed
##D   sla(opriskmodel, alpha = 0.95, plot = TRUE) 
##D   
##D   
## End(Not run)
  



