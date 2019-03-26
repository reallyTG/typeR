library(copBasic)


### Name: JOcopB5
### Title: The Joe/B5 Copula (B5)
### Aliases: JOcopB5
### Keywords: Joe/B5 copula copula (formulas) copula Joe (2014) Examples
###   and Exercises

### ** Examples

# Upper tail dependency of Theta = pi --> 2 - 2^(1/pi) = 0.753131 (Joe, 2014, p. 171).
taildepCOP(cop=JOcopB5, para=pi)$lambdaU # 0.75313

# Blomqvist's Beta of Theta = pi (Joe, 2014, p. 171).
blomCOP(cop=JOcopB5, para=pi)        # 0.5521328
3 - 4*(2*(1/2)^pi - (1/4)^pi)^(1/pi) # 0.5521328

## Not run: 
##D # A test near the limiting Theta for trigamma()
##D UV <- simCOP(cop=JOcopB5, para=2, n=10000)
##D para <- JOcopB5(UV[,1], UV[,2])$para
##D message("Tau difference ", round(2-para, digits=2), " is small.") #
## End(Not run)



