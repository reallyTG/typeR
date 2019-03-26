library(copBasic)


### Name: isfuncCOP
### Title: Is a General Bivariate Function a Copula by Gridded Search?
### Aliases: isfuncCOP
### Keywords: copula (properties) Nelsen (2006) Examples and Exercises

### ** Examples

## Not run: 
##D "NelsenEx2.11" <- function(u,v, ...) { # Nelsen (2006, exer. 2.11, p. 16)
##D   if(length(u) > 1 & length(v) > 1 & length(u) != length(v)) return(NA)
##D   if(length(u) == 1) u <- rep(u, length(v))
##D   if(length(v) == 1) v <- rep(v, length(u))
##D   return(sapply(1:length(u), function(i) { upv <- u[i] + v[i]
##D                  if(2/3 <= upv & upv <= 4/3) return(min(c(u,v,1/3,upv-(2/3))))
##D                  max(u[i]+v[i]-1, 0) }))
##D }
##D isfuncCOP(cop=NelsenEx2.11) # FALSE
## End(Not run)



