library(GDINA)


### Name: Qval
### Title: Q-matrix validation
### Aliases: Qval extract.Qval summary.Qval

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D Q[10,] <- c(0,1,0)
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D pvaf <- Qval(mod1,method = "PVAF",eps = 0.95)
##D pvaf
##D #If many entries are modified, you may want to check
##D #the PVAF plot using the function plotPVAF or
##D #to change eps. eps = 0.9 or 0.8 seems another two
##D #reasonable choices.
##D extract(pvaf,what = "PVAF")
##D #See also:
##D extract(pvaf,what = "varsigma")
##D extract(pvaf,what = "sug.Q")
##D 
##D # Draw a mesa plot
##D plot(pvaf,item=10,type="best",no.qvector=5)
##D 
##D stepwise <- Qval(mod1,method = "wald")
##D stepwise
##D #If many entries are modified, you may want to check
##D #the PVAF plot using the function plotPVAF or
##D #to change eps. eps = 0.9 or 0.8 seems another two
##D #reasonable choices.
##D extract(stepwise,what = "PVAF")
##D #See also:
##D extract(stepwise,what = "varsigma")
##D extract(stepwise,what = "sug.Q")
##D 
##D # Draw a mesa plot
##D plot(stepwise,item=10,type="best",no.qvector=5)
## End(Not run)



