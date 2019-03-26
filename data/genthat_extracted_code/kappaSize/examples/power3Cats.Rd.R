library(kappaSize)


### Name: Power3Cats
### Title: Power-Based Approach for the Number of Subjects Required for a
###   Study of Interobserver Agreement with Three Outcome Categories
### Aliases: Power3Cats print.Power3Cats summary.Power3Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test 
##D kappa0=0.4 vs. kappa1=0.6 with alpha=0.05 and power=0.80 in a study of 
##D interobserver agreement.  Further suppose that the prevalence of the categories is 
##D 0.30, 0.60 and 0.10.
## End(Not run)
Power3Cats(kappa0=0.4, kappa1=0.6, props=c(0.30, 0.60, 0.10), alpha=0.05, power=0.80);



