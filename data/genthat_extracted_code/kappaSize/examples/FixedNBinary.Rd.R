library(kappaSize)


### Name: FixedNBinary
### Title: Calculation of the Lowest Expected Value, kappaL, for a fixed
###   sample size in a Study of Interobserver Agreement with a Binary
###   Outcome
### Aliases: FixedNBinary print.FixedNBinary summary.FixedNBinary
### Keywords: design

### ** Examples

## Not run: 
##D Suppose an investigator would like to determine the expected lower bound for 
##D kappa0=0.7 assuming he has access to 100 subjects and 4 raters.  Further suppose that 
##D the prevalence of the trait is 0.50.
## End(Not run)
FixedNBinary(kappa0=0.7, n=100, props=0.50, alpha=0.05, raters=4);



