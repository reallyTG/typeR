library(uskewFactors)


### Name: uskewFA
### Title: Mixtures of 'Unrestricted' Skew-t Factor Analyzers via the EM
###   algorithm
### Aliases: uskewFA

### ** Examples

data("banknote")
x=banknote[,c(5,6)]
# We let max.it=3 for a speedy illustration.
# More 	iterations are needed to ensure
# convergence.
results=uskewFA(x,G=2,q=1,max.it=3)
results



