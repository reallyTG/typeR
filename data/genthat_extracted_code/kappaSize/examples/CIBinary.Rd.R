library(kappaSize)


### Name: CIBinary
### Title: Confidence Interval Approach for the Number of Subjects Required
###   for a Study of Interobserver Agreement with a Binary Outcome
### Aliases: CIBinary print.CIBinary summary.CIBinary
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test
##D kappa0=0.4 with precision of 0.1 on each side, in a study of interobserver agreement. 
##D Further suppose that the prevalence of the trait of interest is 0.30.
## End(Not run)
CIBinary(kappa0=0.4, kappaL=0.3, kappaU=0.5, props=0.30, alpha=0.05);



