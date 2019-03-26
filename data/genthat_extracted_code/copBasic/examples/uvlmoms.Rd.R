library(copBasic)


### Name: uvlmoms
### Title: Bivariate Skewness after Joe (2014) or the Univariate L-moments
###   of Combined U and V
### Aliases: uvlmoms uvskew
### Keywords: bivariate asymmetry (measures) bivariate skewness L-moments
###   of combined U and V L-moments

### ** Examples

## Not run: 
##D set.seed(234)
##D UV <- simCOP(n=100, cop=GHcop, para=1.5, graphics=FALSE)
##D lmr <- uvlmoms(UV); print(lmr) # L-kurtosis = 0.16568268
##D uvskew(UV, p=0.10)             # -0.1271723
##D uvskew(UV, p=0.10, type="gno") # -0.1467011
## End(Not run)

## Not run: 
##D ps <- seq(0.01,0.49, by=0.01)
##D ETA <- sapply(1:length(ps), function(i) uvskew(UV, p=ps[i], type=5, uvm1=FALSE) )
##D plot(ps, ETA, type="l", xlab="P FACTOR", ylab="BIVARIATE SKEWNESS") #
## End(Not run)



