library(evolqg)


### Name: MultivDriftTest
### Title: Multivariate genetic drift test for 2 populations
### Aliases: MultivDriftTest

### ** Examples


data(dentus)
A <- dentus[dentus$species== "A",-5]
B <- dentus[dentus$species== "B",-5]
G <- cov(A)
MultivDriftTest(A, B, G, Ne = 1000, generations = 250)




