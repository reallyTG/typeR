library(cwhmisc)


### Name: adaptlob
### Title: Numerically evaluate integral using adaptive rules.
### Aliases: adaptlob adaptsim
### Keywords: math

### ** Examples

## Not run: 
##D options(digits=7)
##D FexGander <- function(xx) ifelse(xx < 1,xx+1,ifelse(xx <= 3, 3 - xx, 2 ))
##D adaptsim(sin,0,pi,2.0e-3,TRUE)$Q - 2.0 #   -1.686905e-05
##D adaptsim(sin,0,pi,2.0e-23)$Q - 2.0  # 0
##D adaptsim(FexGander,0,5)$Q - 7.5 # -7.993606e-15 instead of 0
##D adaptlob(FexGander,0,5,2.0e-6,TRUE) # 7.500002 instead of 7.5
##D adaptlob(FexGander,0,5,2.0e-6)$Q - 7.5 #  1.781274e-06 instead of 0
##D adaptlob(FexGander,0,5)$Q-7.5 #   instead of  -8.881784e-16, with warnings
##D #  that required tolerance is too small.
##D adaptlob(FexGander,0,5,5.0*.Machine$double.eps)$Q-7.5 #  -5.329071e-15
## End(Not run)



