library(kappaSize)


### Name: PowerBinary
### Title: Power-Based Approach for the Number of Subjects Required for a
###   Study of Interobserver Agreement with a Binary Outcome
### Aliases: PowerBinary print.PowerBinary summary.PowerBinary
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test 
##D kappa0=0.4 vs. kappa1=0.6 with alpha=0.05 and power=0.80 in a study of 
##D interobserver agreement.  Further suppose that the prevalence of the trait is 0.30.
## End(Not run)
PowerBinary(kappa0=0.4, kappa1=0.6, props=0.30, alpha=0.05, power=0.80);



