library(TimeVTree)


### Name: plot_coxphtree
### Title: Plotting of Full Tree and Subtrees
### Aliases: plot_coxphtree

### ** Examples

#This function requires output from output.coxphout and prune(optional)
data('alcohol')
require(survival)

coxtree <- coxph.tree(alcohol[,'time'], alcohol[,'event'], 
                      x = alcohol[,'alc', drop = FALSE], D = 4)
nodetree <- output.coxphout(coxtree)

subtrees <- prune(nodetree)

plot_coxphtree(nodetree, subtrees, start = 70, pdf = FALSE)



