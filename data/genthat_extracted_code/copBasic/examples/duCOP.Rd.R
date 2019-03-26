library(copBasic)


### Name: duCOP
### Title: The Dual of a Copula Function
### Aliases: duCOP
### Keywords: copula operator joint probability joint probability
###   (exclusive or)

### ** Examples

u <- runif(1); t <- runif(1)
duCOP(cop=W,u,t)    # joint or probability for perfect negative dependence
duCOP(cop=P,u,t)    # joint or probability for perfect        independence
duCOP(cop=M,u,t)    # joint or probability for perfect positive dependence
duCOP(cop=PSP,u,t)  # joint or probability for some positive    dependence

# Next demonstrate COP + duCOP = unity.
"MOcop.formula" <- function(u,v, para=para, ...) {
   alpha <- para[1]; beta <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
}
"MOcop" <- function(u,v, ...) { asCOP(u,v, f=MOcop.formula, ...) }

u <- 0.2; v <- 0.75; ab <- c(1.5, 0.3)
surCOP(1-u,1-v, cop=MOcop, para=ab) + duCOP(u,v, cop=MOcop, para=ab) # UNITY

# See extended code listings and discussion in the Note section


