library(ggdag)


### Name: ggdag_classic
### Title: Quickly plot a DAG in ggplot2
### Aliases: ggdag_classic

### ** Examples


dag  <- dagify(y ~ x + z2 + w2 + w1,
  x ~ z1 + w1,
  z1 ~ w1 + v,
  z2 ~ w2 + v,
  w1 ~~ w2)

ggdag_classic(dag)
ggdag_classic(dag) + theme_dag_blank()

ggdag_classic(dagitty::randomDAG(5, .5))




