library(copBasic)


### Name: composite1COP
### Title: Composition of a Single Symmetric Copula with Two Compositing
###   Parameters
### Aliases: composite1COP
### Keywords: copula composition copula composition (two compositing
###   parameters)

### ** Examples

alpha <- 0.24; beta <- 0.23; Theta1 <- NA;
# W() does not use a parameter, but show how a parameter would be set if needed.
para  <- list(alpha=alpha, beta=beta, cop1=W, para1=Theta1)
t <- composite1COP(0.4,0.6,para)
if( t != W(0.4,0.6)) message("Not equal as expected")

# Next use this as a chance to check logic flow through
# the various "compositing" operators and their as needed
# dispatch to COP()
my.para <- list(cop1=GHcop, para1=exp(+1.098612)+1,
                cop2=PLcop, para2=exp(-1.203973),
                alpha=.5, beta=0.25,
                kappa=.1, gamma=.1,
                weights=c(0.95, 0.05))
# uses cop1/2, para1/2, only weights
nustarCOP(cop=convexCOP,     para=my.para)

# uses cop1/2, para1/2, only alpha
nustarCOP(cop=convex2COP,    para=my.para)

# uses cop1,   para1,   only alpha/beta
nustarCOP(cop=composite1COP, para=my.para)

# uses cop1/2, para1/2, only alpha/beta
nustarCOP(cop=composite2COP, para=my.para)

# uses cop1/2, para1/2, only alpha,beta,kappa,gamma
nustarCOP(cop=composite3COP, para=my.para)



