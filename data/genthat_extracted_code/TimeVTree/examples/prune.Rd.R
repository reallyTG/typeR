library(TimeVTree)


### Name: prune
### Title: Function to Prune Using the Score Statistic
### Aliases: prune

### ** Examples

##Call in alcohol data set
data('alcohol')
require(survival)

coxtree <- coxph.tree(alcohol[,'time'], alcohol[,'event'], 
                      x = alcohol[,'alc', drop = FALSE], D = 4)
nodetree <- output.coxphout(coxtree)

subtrees <- prune(nodetree)



