library(VCA)


### Name: Scale
### Title: Automatically Scale Data Calling These Functions: 'anovaVCA',
###   'anovaMM', 'remlVCA' or 'remlMM'.
### Aliases: Scale

### ** Examples

## Not run: 
##D data(dataEP05A2_3)
##D 
##D # simulate very large numbers of the response
##D dat3   <- dataEP05A2_3
##D dat3$y <- dat3$y * 1e8
##D 
##D # now try to fit 21-day model to this data
##D fit <- anovaVCA(y~day/run, dat3)
##D 
##D # now use 'Scale' function
##D fit1 <- Scale("anovaVCA", y~day/run, dat3)
##D fit2 <- Scale(anovaVCA, y~day/run, dat3)	# also works
##D fit3 <- Scale(anovaVCA(y~day/run, dat3)) # works as well
##D 
##D # back to original scale
##D (fit1 <- reScale(fit1))
##D (fit2 <- reScale(fit2))
##D (fit3 <- reScale(fit3))
##D 
##D # reference values
##D fit0 <- anovaVCA(y~day/run, dataEP05A2_3, MME=TRUE)
##D inf0 <- VCAinference(fit0, VarVC=TRUE)
##D 
##D fit1 <- Scale(anovaVCA(y~day/run, dataEP05A2_3, MME=TRUE))
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
##D fit1 <- Scale("remlVCA", y~day/run, dataEP05A2_3)
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
##D 
##D # scaling also works with by-processing
##D data(VCAdata1)
##D fit <- Scale(anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample"))
##D reScale(fit)
## End(Not run)



