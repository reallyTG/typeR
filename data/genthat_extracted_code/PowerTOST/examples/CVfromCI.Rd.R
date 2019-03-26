library(PowerTOST)


### Name: CVfromCI
### Title: CV from a given Confidence interval
### Aliases: CVfromCI CI2CV

### ** Examples

# Given a 90% confidence interval (without point estimate) 
# from a classical 2x2 crossover with 22 subjects
CVfromCI(lower=0.91, upper=1.15, n=22, design="2x2")
# will give [1] 0.2279405, i.e a CV ~ 23%
#
# unbalanced 2x2 crossover study, but not reported as  such
CI2CV(lower=0.89, upper=1.15, n=24)
# will give a CV ~ 26.3%
# unbalancedness accounted for
CI2CV(lower=0.89, upper=1.15, n=c(16,8))
# should give CV ~ 24.7%



