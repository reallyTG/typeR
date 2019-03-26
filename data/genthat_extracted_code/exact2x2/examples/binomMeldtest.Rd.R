library(exact2x2)


### Name: binomMeld.test
### Title: Melded Binomial Confidence Intervals and Tests
### Aliases: binomMeld.test
### Keywords: htest

### ** Examples

# Note the p-value for all tests of equality 
# (Null Hypthesis: true prop 1=true prop 2)
# are the same, and equal to the 
# Fisher's exact (central) p-value
binomMeld.test(3,5,1,8,parmtype="difference")
binomMeld.test(3,5,1,8,parmtype="ratio")
# note that binomMeld.test gives the unconditional MLE 
# for the odds ratio, while fisher.test and exact2x2 
# gives the conditional MLE for the odds ratio
# (also fisher.test gives the odds ratio defined as 
#  the inverse of how it is defined in binomMeld.test)
binomMeld.test(3,5,1,8,parmtype="oddsratio")
exact2x2(matrix(c(1,8-1,3,5-3),2,2),tsmethod="central")




