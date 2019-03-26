library(ggdag)


### Name: Variable Status
### Title: Find variable status
### Aliases: 'Variable Status' node_status ggdag_status

### ** Examples

dag <- dagify(l ~ x + y,
  y ~ x,
  exposure = "x",
  outcome = "y",
  latent = "l")

node_status(dag)
ggdag_status(dag)




