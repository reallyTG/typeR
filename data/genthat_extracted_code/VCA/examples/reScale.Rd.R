library(VCA)


### Name: reScale
### Title: Re-Scale results of 'VCA' or 'VCAinference' objects which were
###   constructed using scaled values of the response variable.
### Aliases: reScale

### ** Examples

## Not run: 
##D data(dataEP05A2_3)
##D 
##D # reference values
##D fit0 <- anovaVCA(y~day/run, dataEP05A2_3, MME=TRUE)
##D inf0 <- VCAinference(fit0, VarVC=TRUE)
##D 
##D fit1 <- Scale("anovaVCA", y~day/run, dataEP05A2_3, MME=TRUE)
##D inf1 <- VCAinference(fit1, VarVC=TRUE)
##D inf1 <- reScale(inf1)
##D 
##D # compare to reference
##D print(inf0, what="VC")
##D print(inf1, what="VC")
##D print(inf0, what="SD")
##D print(inf1, what="SD")
##D print(inf0, what="CV")
##D print(inf1, what="CV")
##D 
##D # now use REML-based estimation
##D fit0 <- remlVCA(y~day/run, dataEP05A2_3)
##D inf0 <- VCAinference(fit0)
##D 
##D fit1 <- Scale("remlVCA", y~day/run, dataEP05A2_3, MME=TRUE)
##D inf1 <- VCAinference(fit1)
##D inf1 <- reScale(inf1)
##D 
##D # compare to reference
##D print(inf0, what="VC")
##D print(inf1, what="VC")
##D print(inf0, what="SD")
##D print(inf1, what="SD")
##D print(inf0, what="CV")
##D print(inf1, what="CV")
## End(Not run)



