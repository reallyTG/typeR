library(copBasic)


### Name: surfuncCOP
### Title: The Joint Survival Function
### Aliases: surfuncCOP
### Keywords: copula operator joint probability conditional return period

### ** Examples

"MOcop.formula" <- function(u,v, para=para, ...) {
   alpha <- para[1]; beta <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
}
"MOcop" <- function(u,v, ...) { asCOP(u,v, f=MOcop.formula, ...) }
u <- 0.2; v <- 0.75; ab <- c(1.5, 0.3)
# U **and** V are less than or equal to a threshold +
# U **or**  V are less than or equal to a threshold
surCOP(1-u,1-v, cop=MOcop, para=ab) + duCOP(u,v, cop=MOcop, para=ab) # UNITY
surfuncCOP(u,v, cop=MOcop, para=ab) + duCOP(u,v, cop=MOcop, para=ab) # UNITY
## Not run: 
##D # The joint survival function is not a copula so it does not increases to the
##D # upper right with increasing exceedance probabilities. Let us show that by
##D # hacking the surCOP function into a copula for feeding back into the algorithmic
##D # framework of copBasic.
##D UsersCop <- function(u,v, para=NULL) {
##D      afunc <- function(u,v, theta=para) { surfuncCOP(u, v, cop=N4212cop, para=theta)}
##D      return(asCOP(u,v, f=afunc)) }
##D image(gridCOP(cop=UsersCop, para=1.15), col=terrain.colors(20),
##D       xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")#
## End(Not run)
      
## Not run: 
##D # Conditional return period (Salvadori et al., 2007, p. 159)
##D UV <- simCOP(n=100000, cop=PLACKETTcop, para=5, graphics=FALSE)
##D u <- 0.5; v <- 0.99; cd <- UV$V[UV$U > u]
##D by.counting <- length(cd[cd > v])/length(cd)                  # 0.0172
##D by.theo     <- surfuncCOP(u,v, cop=PLACKETTcop, para=5)/(1-u) # 0.0166
##D by.ec       <- surfuncCOP(u,v, cop=EMPIRcop, para=UV)/(1-u)   # 0.0189
##D print(1/by.theo) # conditional return period for V > 0.99 given U > 0.5 
## End(Not run)



