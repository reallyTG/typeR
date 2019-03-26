library(kappaSize)


### Name: FixedN3Cats
### Title: Calculation of the Lowest Expected Value, kappaL for a fixed
###   sample size in a Study of Interobserver Agreement with a Multinomial
###   Outcome (3 Levels)
### Aliases: FixedN3Cats print.FixedN3Cats summary.FixedN3Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the expected lower bound for 
##D kappa0=0.7 assuming he has access to 80 subjects and 5 raters.  Further suppose that 
##D the prevalence of the trait is 0.50.
## End(Not run)
FixedN3Cats(kappa0=0.7, n=80, props=c(0.33, 0.34, 0.33), alpha=0.05, raters=5);



