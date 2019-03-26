library(ggdag)


### Name: is_confounder
### Title: Assess if a variable confounds a relationship
### Aliases: is_confounder

### ** Examples

dag <- dagify(y ~ z, x ~ z)

is_confounder(dag, "z", "x", "y")
is_confounder(dag, "x", "z", "y")




