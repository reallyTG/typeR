library(Zelig)


### Name: Zelig-poisson-bayes-class
### Title: Bayesian Poisson Regression
### Aliases: Zelig-poisson-bayes-class zpoissonbayes

### ** Examples

data(sanction)
z.out <- zelig(num ~ target + coop, model = "poisson.bayes",data = sanction, verbose = FALSE)




