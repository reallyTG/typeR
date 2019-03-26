library(ggdag)


### Name: ggdag
### Title: Quickly plot a DAG in ggplot2
### Aliases: ggdag

### ** Examples


dag  <- dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  w1 ~~ w2)

ggdag(dag)
ggdag(dag) + theme_dag_blank()

ggdag(dagitty::randomDAG(5, .5))




