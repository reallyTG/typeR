library(mixlm)


### Name: prop.test.ordinary
### Title: Test of Equal or Given Proportions in text-book version
### Aliases: prop.test.ordinary
### Keywords: htest

### ** Examples

heads <- rbinom(1, size=100, prob = .5)
prop.test(heads, 100)          # continuity correction TRUE by default
prop.test(heads, 100, correct = FALSE)

## Data from Fleiss (1981), p. 139.
## H0: The null hypothesis is that the four populations from which
##     the patients were drawn have the same true proportion of smokers.
## A:  The alternative is that this proportion is different in at
##     least one of the populations.

smokers  <- c( 83, 90, 129, 70 )
patients <- c( 86, 93, 136, 82 )
prop.test.ordinary(smokers, patients)



