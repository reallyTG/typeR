library(TOSTER)


### Name: TOSTpaired.raw
### Title: TOST function for a dependent t-test (raw scores)
### Aliases: TOSTpaired.raw

### ** Examples

## Test means of 5.83 and 5.75, standard deviations of 1.17 and 1.30 in sample of 65 pairs
## with correlation between observations of 0.745 using equivalence bounds in raw units of
## -0.34 and 0.34, (with default alpha setting of = 0.05).
TOSTpaired.raw(n=65,m1=5.83,m2=5.75,sd1=1.17,sd2=1.30,r12=0.745,low_eqbound=-0.34,high_eqbound=0.34)



