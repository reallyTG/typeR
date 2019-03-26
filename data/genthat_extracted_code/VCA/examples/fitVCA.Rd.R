library(VCA)


### Name: fitVCA
### Title: Fit Variance Component Model by ANOVA or REML.
### Aliases: fitVCA

### ** Examples

## Not run: 
##D #load data (CLSI EP05-A2 Within-Lab Precision Experiment) 
##D data(dataEP05A2_2)
##D 
##D # perform ANOVA-estimation of variance components
##D res.anova <- fitVCA(y~day/run, dataEP05A2_2, "anova")
##D # perform REML-estimation of variance components
##D res.reml <- fitVCA(y~day/run, dataEP05A2_2, "reml")
##D 
##D # compare scaling vs. not scaling the response
##D fit0 <- fitVCA(y~day/run, dataEP05A2_2, "anova", scale=TRUE)
##D fit1 <- fitVCA(y~day/run, dataEP05A2_2, "anova", scale=FALSE)
## End(Not run)



