library(TOSTER)


### Name: TOSTone
### Title: TOST function for a one-sample t-test (Cohen's d)
### Aliases: TOSTone

### ** Examples

## Test observed mean of 0.54 and standard deviation of 1.2 in sample of 100 participants
## against 0.5 given equivalence bounds of Cohen's d = -0.3 and 0.3, with an alpha = 0.05.
TOSTone(m=0.54,mu=0.5,sd=1.2,n=100,low_eqbound_d=-0.3, high_eqbound_d=0.3, alpha=0.05)



