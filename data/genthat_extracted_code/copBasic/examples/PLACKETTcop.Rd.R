library(copBasic)


### Name: PLACKETTcop
### Title: The Plackett Copula
### Aliases: PLACKETTcop PLcop
### Keywords: Plackett copula copula (formulas) copula (density) copula Joe
###   (2014) Examples and Exercises

### ** Examples

PLACKETTcop(0.4,0.6,para=1)
P(0.4,0.6) # independence copula, same two values because Theta == 1
PLcop(0.4,0.6,para=10.25) # joint probability through positive association

## Not run: 
##D # Joe (2014, p. 164) shows the closed form copula density of the Plackett.
##D "dPLACKETTcop" <- function(u,v,para) {
##D    eta <- para - 1; A <- para*(1 + eta*(u+v-2*u*v))
##D    B <- ((1 + eta*(u+v))^2 - 4*para*eta*u*v)^(3/2); return(A/B)
##D }
##D u <- 0.08; v <- 0.67 # Two probabilities to make numerical evaluations.
##D del <- 0.0001 # a 'small' differential value of probability
##D u1 <- u; u2 <- u+del; v1 <- v; v2 <- v+del
##D # Density following (Nelsen, 2006, p. 10)
##D dCrect <- (PLcop(u2, v2, para=10.25) - PLcop(u2, v1, para=10.25) -
##D            PLcop(u1, v2, para=10.25) + PLcop(u1, v1, para=10.25))/del^2
##D dCanal <- dPLACKETTcop(u,  v,  para=10.25)
##D dCfunc <- densityCOP(u, v, cop=PLcop, para=10.25, deluv = del)
##D R <- round(c(dCrect, dCanal, dCfunc), digits=6)
##D message("Density: ", R[1], "(manual), ", R[2], "(analytical), ", R[3], "(function)");
##D 
##D # Comparison of partial derivatives
##D dUr <- (PLcop(u2, v2, para=10.25) - PLcop(u1, v2, para=10.25))/del
##D dVr <- (PLcop(u2, v2, para=10.25) - PLcop(u2, v1, para=10.25))/del
##D dU  <-  derCOP(u, v, cop=PLcop, para=10.25)
##D dV  <- derCOP2(u, v, cop=PLcop, para=10.25)
##D R   <- round(c(dU, dV, dUr, dVr), digits=6)
##D message("Partial derivatives dU=", R[1], " and dUr=", R[3], "\n",
##D         "                    dV=", R[2], " and dVr=", R[4]) #
## End(Not run)



