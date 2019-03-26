library(kappaSize)


### Name: FixedN5Cats
### Title: Calculation of the Lowest Expected Value, kappaL, for a fixed
###   sample size in a Study of Interobserver Agreement with a Multinomial
###   Outcome (5 Levels)
### Aliases: FixedN5Cats print.FixedN5Cats summary.FixedN5Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the expected lower bound for
##D kappa0=0.6 assuming he has access to 150 subjects and 2 raters.  Further suppose that 
##D the prevalence of the traits of interest are 0.4, 0.2, 0.2, 0.1, 0.1.
## End(Not run)
FixedN5Cats(kappa0=0.6, n=150, props=c(0.4, 0.2, 0.2, 0.1, 0.1), alpha=0.05, raters=2);



