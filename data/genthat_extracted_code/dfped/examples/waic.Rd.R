library(dfped)


### Name: waic
### Title: Function for the Watanabe-Akaike information criteria (WAIC)
### Aliases: waic fitDataj

### ** Examples

## Not run: 
##D 	for(s in 1:nbDesign){
##D 		fitj <- fitDataj(stan_model, nbPatientsj, nbDoses, tox, eff, given_dose,
##D 						 skeleton_tox, skeleton_eff, mu, sigma, s)
##D 		waicj <- waic(stanfit=fitj, s)
##D 	}
## End(Not run)



