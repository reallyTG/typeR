library(fuzzySim)


### Name: stepByStep
### Title: Analyse and compare stepwise model predictions
### Aliases: stepByStep
### Keywords: models regression multivariate

### ** Examples

data(rotif.env)

stepByStep(data = rotif.env, sp.col = 18, var.cols = 5:17, 
cor.method = "spearman")
 
stepByStep(data = rotif.env, sp.col = 18, var.cols = 5:17, 
cor.method = "spearman", Favourability = TRUE)
 
stepByStep(data = rotif.env, sp.col = 9, var.cols = c(5:8, 10:17), 
family = poisson)



