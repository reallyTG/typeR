library(EValue)


### Name: evalues.RR
### Title: Compute E-value for a risk ratio or rate ratio and its
###   confidence interval limits
### Aliases: evalues.RR

### ** Examples

# compute E-value for leukemia example in VanderWeele and Ding (2017)
evalues.RR( 0.80, 0.71, 0.91 )

# you can also pass just the point estimate
evalues.RR( 0.80 )

# demonstrate symmetry of E-value
# this apparently causative association has same E-value as the above
evalues.RR( 1 / 0.80 )



