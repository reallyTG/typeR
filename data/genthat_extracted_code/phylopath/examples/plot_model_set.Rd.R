library(phylopath)


### Name: plot_model_set
### Title: Plot several causal hypothesis at once.
### Aliases: plot_model_set

### ** Examples

m <- list(one = DAG(a ~ b + c + d), two = DAG(a ~ b, b ~ c, d ~ d))
plot_model_set(m)
plot_model_set(m, algorithm = "sugiyama")



