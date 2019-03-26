library(Surrogate)


### Name: BimixedContCont
### Title: Fits a bivariate mixed-effects model to assess surrogacy in the
###   meta-analytic multiple-trial setting (Continuous-continuous case)
### Aliases: BimixedContCont
### Keywords: Multiple-trial setting Meta-analytic framework Trial-level
###   surrogacy Individual-level surrogacy Mixed-effect models

### ** Examples

# Open the Schizo dataset (clinial trial in schizophrenic patients)
data(Schizo)

## Not run: 
##D  #Time consuming (>5 sec) code part
##D # When a reduced bivariate mixed-effect model is used to assess surrogacy, 
##D # the conditioning number for the D matrix is very high: 
##D Sur <- BimixedContCont(Dataset=Schizo, Surr=BPRS, True=PANSS, Treat=Treat, Model="Reduced", 
##D Trial.ID=InvestId, Pat.ID=Id)
##D 
##D # Such problems often occur when the total number of patients, the total number 
##D # of trials and/or the trial-level heterogeneity
##D # of the treatment effects is relatively small
##D 
##D # As an alternative approach to assess surrogacy, consider using the functions
##D # BifixedContCont, UnifixedContCont or UnimixedContCont in the meta-analytic framework,
##D # or use the information-theoretic approach
## End(Not run)



