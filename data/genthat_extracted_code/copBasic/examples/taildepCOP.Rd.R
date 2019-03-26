library(copBasic)


### Name: taildepCOP
### Title: The Lower- and Upper-Tail Dependency Parameters of a Copula
### Aliases: taildepCOP
### Keywords: copula (characteristics) copula (properties) copula (tail
###   characteristics) copula (tail properties) Nelsen (2006) Examples and
###   Exercises tail dependence package copula (comparison to)

### ** Examples

# Plot the tail dependencies by nonexceedance probability for a
# for a positive association Plackett copula and see that both are zero.
taildepCOP(cop=PLACKETTcop, para=3, plotem=TRUE)
# So Plackett has no tail dependency, as Nelsen (2006, p. 215) shows.

## Not run: 
##D "MOcop" <- function(u,v, para=NULL) { # Marshall-Olkin copula
##D    alpha <- para[1]; beta <- para[2]; return(min(v*u^(1-alpha), u*v^(1-beta)))
##D } # The results that follow match those reported by Nelsen (2006, p. 215).
##D taildepCOP(cop=MOcop, para=c(0.4, 0.9)) # LambL = 0, LambU = 0.4 [min(alpha,beta)]
## End(Not run)

## Not run: 
##D # Analytical solution to Gumbel-Hougaard copula from the copula package:
##D copula::lambda(copula::gumbelCopula(3))
##D #   lower    upper
##D # 0.000000 0.740079
##D # Numerical approximation (see copBasic::GHcop for analytical formula):
##D as.data.frame(taildepCOP(GHcop, para=3))
##D #  lambdaL lambdaU     source
##D #1 0.00012 0.74008 taildepCOP 
## End(Not run)

## Not run: 
##D # Plot the tail dependencies by nonexceedance probability
##D # for the PSP copula, which has lower but no upper-tail dependence.
##D taildepCOP(cop=PSP, para=NULL, plotem=TRUE) # LambL=0.5, LambU=0
##D # which is readily confirmed by simCOP(1000, cop=PSP)
##D # Nelsen (2006, p. 216) reports that this copula has LambL=1/2 and LambU=0.
##D 
##D # How about some composited Plackett-Plackett copulas?
##D # Each has upper- and lower-tail dependence parameters equal to zero.
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.00395,  para2=4.67, alpha=0.9392, beta=0.5699)
##D taildepCOP(cop=composite2COP, para=para, plot=TRUE, verbose=TRUE)
##D # This next Plackett-Plackett is interesting because at its core it looks
##D # like it should be both tail dependent like M() but the shapes of the curves
##D # are quite different from those of M().
##D para <- list(cop1=PLACKETTcop,  cop2=PLACKETTcop,
##D              para1=0.101,  para2=4493, alpha=0.0063, beta=0.0167)
##D taildepCOP(cop=composite2COP, para=para, plot=TRUE)
##D # This example shows numerical instability for the upper tail.
## End(Not run)



