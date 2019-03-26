library(copBasic)


### Name: coCOP
### Title: The Co-Copula Function
### Aliases: coCOP
### Keywords: copula operator joint probability

### ** Examples

u <- 1 - runif(1); v <- 1 - runif(1) # as exceedance, in order to reinforce the
# change to exceedance instead of nonexceedance that otherwise dominates this package
message("Exceedance probabilities u' and v' are ", u, " and ", v)
coCOP(u,v,cop=PLACKETTcop, para=10) # Positive association Plackett

# computation using  manual  manipulation to nonexceedance probability
1 - COP(cop=PSP,(1-u),(1-v))
# computation using internal manipulation to nonexceedance probability
  coCOP(cop=PSP,   u,    v)

# Next demonstrate COP + coCOP = unity.
"MOcop.formula" <- function(u,v, para=para, ...) { # Marshall-Olkin copula
   alpha <- para[1]; beta <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
}
"MOcop" <- function(u,v, ...) { asCOP( u,  v, f=MOcop.formula, ...) }
u <- 0.2; v <- 0.75; ab <- c(1.5, 0.3)
COP(u,v, cop=MOcop, para=ab) + coCOP(1-u,1-v, cop=MOcop, para=ab) # UNITY



