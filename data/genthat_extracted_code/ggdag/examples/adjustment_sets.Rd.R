library(ggdag)


### Name: Covariate Adjustment Sets
### Title: Covariate Adjustment Sets
### Aliases: 'Covariate Adjustment Sets' dag_adjustment_sets
###   ggdag_adjustment_set

### ** Examples

dag <- dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  w1 ~~ w2,
  exposure = "x",
  outcome = "y")

tidy_dagitty(dag) %>% dag_adjustment_sets()

ggdag_adjustment_set(dag)

ggdag_adjustment_set(dagitty::randomDAG(10, .5),
  exposure = "x3",
  outcome = "x5")




