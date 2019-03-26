library(elliptic)


### Name: K.fun
### Title: quarter period K
### Aliases: K.fun e16.1.1
### Keywords: math

### ** Examples

K.fun(0.09)  # AMS-55 give 1.60804862 in example 7 on page 581

# next example not run because: (i), it needs gsl; (ii) it gives a warning.
## Not run: 
##D K.fun(0.4,strict=F, maxiter=4) - ellint_Kcomp(sqrt(0.4))
## End(Not run)



