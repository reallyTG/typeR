library(kappaSize)


### Name: CI5Cats
### Title: Confidence Interval Approach for the Number of Subjects Required
###   for a Study of Interobserver Agreement with Five Outcome Categories
### Aliases: CI5Cats print.CI5Cats summary.CI5Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test 
##D kappa0=0.4 with precision of 0.1 on each side, in a study of interobserver agreement.  
##D Further suppose that the prevalence of the traits are 0.13, 0.17, 0.2, 0.2, 0.3.
## End(Not run)

CI5Cats(kappa0=0.4, kappaL=0.3, kappaU=0.5, props=c(0.13, 0.17, 0.2, 0.2, 0.3), alpha=0.05);



