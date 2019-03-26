library(jmuOutlier)


### Name: power.binom.test
### Title: Power Calculations for Exact Binomial Test
### Aliases: power.binom.test
### Keywords: Binomial test Power

### ** Examples

# Alternative distribution is Normal( mean=55.7, sd=2.5 ).
power.binom.test( 30, 0.05, "greater", 55, pnorm, 55.7, 2.5 )

# Alternative distribution is Laplace( mean=55.7, sd=2.5 ).
power.binom.test( 30, 0.05, "greater", 55, plaplace, 55.7, 2.5 )



