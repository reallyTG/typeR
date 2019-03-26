library(mistral)


### Name: IRW
### Title: Increasing Randow Walk
### Aliases: IRW NestedSampling TPA

### ** Examples

# Get faililng samples for the kiureghian limit state function
# Failure is defined as lsf(X) < 0 so we have to invert the lsf
lsf <- function(x) -1*kiureghian(x)
## Not run: 
##D fail.samp <- IRW(2, lsf, q = 0, N = 10, plot = TRUE)
## End(Not run)



