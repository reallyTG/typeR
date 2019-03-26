library(ggdag)


### Name: Adjust for variables
### Title: Adjust for variables and activate any biasing paths that result
### Aliases: 'Adjust for variables' control_for ggdag_adjust

### ** Examples

dag <- dagify(m ~ a + b, x ~ a, y ~ b)

control_for(dag, var = "m")
ggdag_adjust(dag, var = "m")




