library(phenology)


### Name: lnLCF
### Title: Calculate the -log likelihood of data within a model.
### Aliases: lnLCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002)
##D lnLCF(x=c(mu=4.71768454279272, 
##D                          sd=1.075711951667, 
##D                          p=-1.79746277312909), 
##D                  data=ECFOCF_2002)
##D 
##D 
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002, date0=as.Date("2002-01-01"))
##D fp <- rep(0, dim(ECFOCF_2002)[3])
##D names(fp) <- paste0("p.", formatC(1:(dim(ECFOCF_2002)[3]), width=2, flag="0"))
##D par <- c(mu1 = 0.6404831115214353, 
##D          sd1 = 0.69362774786433479, 
##D          mu2 = 5.6404831115214353, 
##D          sd2 = 5.69362774786433479, 
##D          mu_season = 12.6404831115214353, 
##D          sd_season = 1.69362774786433479, 
##D          OTN=1)
##D par <- c(par, fp[attributes(ECFOCF_2002)$table["begin"]:attributes(ECFOCF_2002)$table["end"]])
##D fixed.parameters <- c(p=-Inf)
##D 
##D lnLCF(x=par, data=ECFOCF_2002, fixed.parameters=fixed.parameters)
## End(Not run)




