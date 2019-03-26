library(systemicrisk)


### Name: genL
### Title: Generate Liabilities Matrix from Prior
### Aliases: genL

### ** Examples

n <- 5
m <- Model.Indep.p.lambda(Model.p.BetaPrior(n),
                          Model.lambda.GammaPrior(n,scale=1e-1))
genL(m)




