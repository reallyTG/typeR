library(phenology)


### Name: logLik.ECFOCF
### Title: Return Log Likelihood of a fit done using fitCF
### Aliases: logLik.ECFOCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002, date0=as.Date("2002-01-01"))
##D par <- c(mu = 2.6404831115214353, 
##D         size = 0.69362774786433479, 
##D         mu_season = 12.6404831115214353, 
##D         size_season = 1.69362774786433479, 
##D         a2=0)
##D fp <- rep(0, dim(ECFOCF_2002)[3])
##D names(fp) <- paste0("p.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:attributes(ECFOCF_2002)$table["end"]])
##D fixed.parameters <- c(a1=Inf, p=-Inf)
##D 
##D  lnLCF(x=par, data=ECFOCF_2002, fixed.parameters=fixed.parameters)
##D  
##D  o_mu1season1a2p <- fitCF(x=par, fixed.parameters=fixed.parameters, 
##D                           data=ECFOCF_2002)
##D  
##D logLik(o_mu1season1a2p)
##D AIC(o_mu1season1a2p)
## End(Not run)



