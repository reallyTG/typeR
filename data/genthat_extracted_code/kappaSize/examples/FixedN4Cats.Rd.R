library(kappaSize)


### Name: FixedN4Cats
### Title: Calculation of the Lowest Expected Value, kappaL, for a fixed
###   sample size in a Study of Interobserver Agreement with a Multinomial
###   Outcome (4 Levels)
### Aliases: FixedN4Cats print.FixedN4Cats summary.FixedN4Cats
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the expected lower bound for 
##D kappa0=0.7 assuming he has access to 80 subjects and 5 raters.  Further suppose that 
##D the prevalence of the traits of interest are 0.4, 0.4, 0.1, 0.1.
## End(Not run)
FixedN4Cats(kappa0=0.7, n=80, props=c(0.4, 0.4, 0.1, 0.1), alpha=0.05, raters=5);



