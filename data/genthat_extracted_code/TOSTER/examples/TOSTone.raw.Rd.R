library(TOSTER)


### Name: TOSTone.raw
### Title: TOST function for a one-sample t-test (raw scores)
### Aliases: TOSTone.raw

### ** Examples

## Test observed mean of 0.52 and standard deviation of 0.52 in sample of 300 participants
## against 0.5 given equivalence bounds in raw units of -0.1 and 0.1, with an alpha = 0.05.
TOSTone.raw(m=0.52,mu=0.5,sd=0.5,n=300,low_eqbound=-0.1, high_eqbound=0.1, alpha=0.05)



