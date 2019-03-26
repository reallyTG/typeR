library(copBasic)


### Name: HRcop
### Title: The Hüsler-Reiss Extreme Value Copula
### Aliases: HRcop
### Keywords: Husler--Reiss copula copula (formulas) copula Joe (2014)
###   Examples and Exercises copula (extreme value) extreme value copula

### ** Examples

# Parameter Theta = pi recovery through Blomqvist's Beta (Joe, 2014, p. 176)
qnorm(1 - log(1+blomCOP(cop=HRcop, para=pi))/(2*log(2)))^(-1)



