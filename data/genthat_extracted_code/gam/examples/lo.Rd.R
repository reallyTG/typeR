library(gam)


### Name: lo
### Title: Specify a loess fit in a GAM formula
### Aliases: lo gam.lo
### Keywords: models regression nonparametric smooth

### ** Examples

y ~ Age + lo(Start)
     # fit Start using a loess smooth with a (default) span of 0.5.
y ~ lo(Age) + lo(Start, Number) 
y ~ lo(Age, span=0.3) # the argument name span cannot be abbreviated.



