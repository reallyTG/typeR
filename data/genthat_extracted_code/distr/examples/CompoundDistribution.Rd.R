library(distr)


### Name: CompoundDistribution
### Title: Generating function for Class "CompoundDistribution"
### Aliases: CompoundDistribution
### Keywords: distribution list

### ** Examples

CP0 <- CompoundDistribution(Pois(), Norm())
CP0
CP1 <- CompoundDistribution(DiscreteDistribution(supp = c(1,5,9,11),
                            prob = dbinom(0:3, size = 3,prob = 0.3)),Norm())
CP1
UL <- UnivarDistrList(Norm(), Binom(10,0.3), Chisq(df=4), Norm(),
                      Binom(10,0.3), Chisq(df=4), Norm(), Binom(10,0.3),
                      Chisq(df=4), Td(5), Td(10))
CP2 <- CompoundDistribution(DiscreteDistribution(supp = c(1,5,9,11),
                      prob = dbinom(0:3, size = 3, prob = 0.3)),UL)
plot(CP2)



