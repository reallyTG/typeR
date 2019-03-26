library(VCA)


### Name: fixef.VCA
### Title: Extract Fixed Effects from 'VCA' Object.
### Aliases: fixef.VCA

### ** Examples

## Not run: 
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/(run), dataEP05A2_1)
##D fixef(fit)
##D 
##D # for complex models it might take some time computing complex output
##D data(VCAdata1)
##D fit <- anovaMM(y~(lot+device)/(day)/(run), VCAdata1[VCAdata1$sample==2,])
##D fixef(fit, "c")
## End(Not run)



