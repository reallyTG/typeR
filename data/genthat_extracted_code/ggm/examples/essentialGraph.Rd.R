library(ggm)


### Name: essentialGraph
### Title: Essential graph
### Aliases: essentialGraph
### Keywords: graphs models multivariate

### ** Examples

dag = DAG(U ~ Y+Z, Y~X, Z~X)
essentialGraph(dag)



