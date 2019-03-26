library(VGAM)


### Name: logc
### Title: Complementary-log Link Function
### Aliases: logc
### Keywords: math models regression

### ** Examples

## Not run: 
##D logc(seq(-0.2, 1.1, by = 0.1))  # Has NAs
## End(Not run)
logc(seq(-0.2, 1.1, by = 0.1), bvalue = 1 - .Machine$double.eps)  # Has no NAs



