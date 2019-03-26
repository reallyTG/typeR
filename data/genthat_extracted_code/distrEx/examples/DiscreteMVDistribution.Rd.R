library(distrEx)


### Name: DiscreteMVDistribution
### Title: Generating function for multivariate discrete distribution
### Aliases: DiscreteMVDistribution
### Keywords: distribution

### ** Examples

# Dirac-measure at (0,0,0)
D1 <- DiscreteMVDistribution(supp = c(0,0,0))
support(D1)

# simple discrete distribution
D2 <- DiscreteMVDistribution(supp = matrix(c(0,1,0,2,2,1,1,0), ncol=2), 
                prob = c(0.3, 0.2, 0.2, 0.3))
support(D2)
r(D2)(10)



