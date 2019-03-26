library(kappaSize)


### Name: Power5Cats
### Title: Power-Based Approach for the Number of Subjects Required for a
###   Study of Interobserver Agreement with Five Outcome Categories
### Aliases: Power5Cats print.Power5Cats summary.Power5Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test 
##D kappa0=0.4 vs. kappa1=0.6 with alpha=0.05 and power=0.80 in a study of 
##D interobserver agreement.  Further suppose that the prevalence of the categories is 
##D 0.30, 0.20, 0.10, 0.30 and 0.10.
## End(Not run)
Power5Cats(kappa0=0.4, kappa1=0.6, props=c(0.30, 0.20, 0.10, 0.30, 0.10), alpha=0.05, power=0.80);



