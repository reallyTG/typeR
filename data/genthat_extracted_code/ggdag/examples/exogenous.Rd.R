library(ggdag)


### Name: Exogenous Variables
### Title: Find Exogenous Variables
### Aliases: 'Exogenous Variables' node_exogenous ggdag_exogenous

### ** Examples

dag <- dagify(y ~ x1 + x2 + x3, b ~ x1 + x2)
ggdag_exogenous(dag)
node_exogenous(dag)




