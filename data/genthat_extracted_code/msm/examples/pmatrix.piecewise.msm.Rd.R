library(msm)


### Name: pmatrix.piecewise.msm
### Title: Transition probability matrix for processes with
###   piecewise-constant intensities
### Aliases: pmatrix.piecewise.msm
### Keywords: models

### ** Examples

## Not run: 
##D ## In a clinical study, suppose patients are given a placebo in the
##D ## first 5 weeks, then they begin treatment 1 at 5 weeks, and
##D ## a combination of treatments 1 and 2 from 10 weeks.
##D ## Suppose a multi-state model x has been fitted for the patients'
##D ## progress, with treat1 and treat2 as time dependent covariates.
##D 
##D ## Cut points for when treatment covariate changes
##D times <- c(0, 5, 10)
##D 
##D ## Indicators for which treatments are active in the four intervals
##D ## defined by the three cut points
##D covariates <- list( list (treat1=0, treat2=0), list (treat1=0, treat2=0), list(treat1=1, treat2=0),
##D list(treat1=1, treat2=1) )
##D 
##D ## Calculate transition probabilities from the start of the study to 15 weeks
##D pmatrix.piecewise.msm(x, 0, 15, times, covariates)
## End(Not run)



