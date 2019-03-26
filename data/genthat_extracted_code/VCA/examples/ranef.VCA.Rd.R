library(VCA)


### Name: ranef.VCA
### Title: Extract Random Effects from 'VCA' Object.
### Aliases: ranef.VCA

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D ranef(fit)
##D 
##D # get variable-specific random effects (REs)
##D # both extract the same REs
##D ranef(fit, "day")
##D ranef(fit, 1)
##D 
##D # get standardized REs
##D ranef(fit, "day:run", "standard")
##D 
##D # or studentized REs
##D ranef(fit, 2, "stu")
## End(Not run)



