library(copBasic)


### Name: RFcop
### Title: The Raftery Copula
### Aliases: RFcop
### Keywords: Raftery copula copula (formulas) copula Nelsen (2006)
###   Examples and Exercises

### ** Examples

# Lower tail dependency of Theta = 0.5 --> 2*(0.5)/(1+0.5) = 2/3 (Nelsen, 2006, p. 214)
taildepCOP(cop=RFcop, para=0.5)$lambdaL # 0.66667

## Not run: 
##D # Simulate for a Spearman Rho of 0.7, then extract estimated Theta that
##D # internally is based on Kendall Tau of U and V, then convert estimate
##D # to equivalent Rho.
##D UV <- simCOP(1000, cop=RFcop, RFcop(rho=0.7)$para)
##D Theta <- RFcop(UV$U, UV$V)$para      # 0.605093
##D Rho <- Theta*(4-3*Theta)/(2-Theta)^2 # 0.679403 (nearly 0.7)#
## End(Not run)



