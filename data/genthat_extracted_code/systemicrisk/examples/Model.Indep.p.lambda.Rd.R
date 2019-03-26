library(systemicrisk)


### Name: Model.Indep.p.lambda
### Title: Combination of Independent Models for p and lambda
### Aliases: Model.Indep.p.lambda

### ** Examples

n <- 5
m <- Model.Indep.p.lambda(Model.p.BetaPrior(n),
                          Model.lambda.GammaPrior(n,scale=1e-1))
genL(m)




