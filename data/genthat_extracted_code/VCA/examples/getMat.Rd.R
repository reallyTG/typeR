library(VCA)


### Name: getMat
### Title: Extract a Specific Matrix from a 'VCA' Object.
### Aliases: getMat

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D getMat(fit, "Z")
##D getMat(fit, "Zday")
##D getMat(fit, "Zday:run")
##D getMat(fit, "Zerror")
##D fit2 <- anovaMM(y~day/(run), dataEP05A2_1)
##D getMat(fit2, "V")			 	# Var(y)
##D getMat(fit2, "G")				# Var(re)
## End(Not run)



