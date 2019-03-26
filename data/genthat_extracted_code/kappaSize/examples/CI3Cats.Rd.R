library(kappaSize)


### Name: CI3Cats
### Title: Confidence Interval Approach for the Number of Subjects Required
###   for a Study of Interobserver Agreement with Three Outcome Categories
### Aliases: CI3Cats print.CI3Cats summary.CI3Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the required sample size to test 
##D kappa0=0.4 with precision of 0.2 on each side, in a study of interobserver agreement 
##D (3 raters).  Further suppose that the prevalence of the traits are 0.30, 0.2, 0.5.
## End(Not run)

CI3Cats(kappa0=0.4, kappaL=0.3, kappaU=0.6, props=c(0.30, 0.2, 0.5), raters=3, alpha=0.05);



