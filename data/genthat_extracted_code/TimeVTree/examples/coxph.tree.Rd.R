library(TimeVTree)


### Name: coxph.tree
### Title: Function to Grow the Tree Using the Score Statistic
### Aliases: coxph.tree infmul rawscore xname

### ** Examples

##Call in alcohol data set
data('alcohol')
require(survival)

coxtree <- coxph.tree(alcohol[,'time'], alcohol[,'event'], 
                      x = alcohol[,'alc', drop = FALSE], D = 4)

nodetree <- output.coxphout(coxtree)

subtrees <- prune(nodetree)



