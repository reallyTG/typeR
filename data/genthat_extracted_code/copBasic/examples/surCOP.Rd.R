library(copBasic)


### Name: surCOP
### Title: The Survival Copula
### Aliases: surCOP
### Keywords: copula operator joint probability copula (reflection)

### ** Examples

u  <-  0.26; v  <- 0.55   # nonexceedance probabilities
up <- 1 - u; vp <- 1 - v  #    exceedance probabilities
surCOP(up, vp,   cop=PSP, exceedance=TRUE)  # 0.4043928
surCOP(u, v,     cop=PSP, exceedance=FALSE) # 0.4043928 (same because of symmetry)
surfuncCOP(u, v, cop=PSP)                   # 0.4043928
# All three examples show joint prob. that U > u and V > v.

## Not run: 
##D # A survival copula is a copula so it increases to the upper right with increasing
##D # exceedance probabilities. Let us show that by hacking the surCOP function into
##D # a copula for feeding back into the algorithmic framework of copBasic.
##D UsersCop <- function(u,v, para=NULL) {
##D      afunc <- function(u,v, theta=para) { surCOP(u, v, cop=N4212cop, para=theta)}
##D      return(asCOP(u,v, f=afunc)) }
##D image(gridCOP(cop=UsersCop, para=1.15), col=terrain.colors(20),
##D       xlab="U, EXCEEDANCE PROBABILITY", ylab="V, EXCEEDANCE PROBABILITY") #
## End(Not run)



