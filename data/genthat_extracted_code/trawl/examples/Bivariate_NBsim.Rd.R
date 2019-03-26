library(trawl)


### Name: Bivariate_NBsim
### Title: Simulates from the bivariate negative binomial distribution
### Aliases: Bivariate_NBsim

### ** Examples

set.seed(1)
kappa <- 3
p1 <- 0.1
p2 <- 0.85
N <- 100
#Simulate N realisations from the bivariate negative binomial distribution
y <- Bivariate_NBsim(N,kappa,p1,p2)



