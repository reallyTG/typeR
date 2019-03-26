library(ggdag)


### Name: Canonicalize DAGs
### Title: Canonicalize a DAG
### Aliases: 'Canonicalize DAGs' node_canonical ggdag_canonical

### ** Examples

dag <- dagify(y ~ x + z, x ~~ z)

ggdag(dag)

node_canonical(dag)
ggdag_canonical(dag)




