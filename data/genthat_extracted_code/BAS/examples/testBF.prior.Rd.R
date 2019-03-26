library(BAS)


### Name: testBF.prior
### Title: Test based Bayes Factors for BMA Models
### Aliases: testBF.prior

### ** Examples


testBF.prior(100)
library(MASS)
data(Pima.tr)

# use g = n
bas.glm(type ~ .,
  data = Pima.tr, family = binomial(),
  betaprior = testBF.prior(nrow(Pima.tr)),
  modelprior = uniform(), method = "BAS"
)



