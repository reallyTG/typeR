library(VCA)


### Name: residuals.VCA
### Title: Extract Residuals of a 'VCA' Object.
### Aliases: residuals.VCA resid

### ** Examples

## Not run: 
##D data(VCAdata1)
##D datS1 <- VCAdata1[VCAdata1$sample==1,]
##D fit1  <- anovaVCA(y~(lot+device)/(day)/(run), datS1) 
##D 
##D # default is conditional (raw) residuals
##D resid(fit1)
##D resid(fit1, "m")
##D 
##D # get standardized version
##D resid(fit1, mode="stand")		# conditional residuals (default)
##D resid(fit1, "marg", "stand")		# marginal residuals
##D 
##D # get studentized version, taking their 
##D # covariances into account
##D resid(fit1, mode="stud")		# conditional residuals (default)
##D resid(fit1, "marg", "stud")		# marginal residuals
## End(Not run)




