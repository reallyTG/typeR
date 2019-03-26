library(abn)


### Name: essentialGraph
### Title: Plot an ABN graphic
### Aliases: essentialGraph
### Keywords: DAG, PDAG

### ** Examples

dag <- matrix(data = c(0,0,0,
                          1,0,0,
                          1,1,0),nrow = 3,ncol = 3)
dist <- list(a="gaussian",b="gaussian",c="gaussian")     
colnames(dag) <- rownames(dag) <- names(dist)
                          
essentialGraph(dag.m = dag)



