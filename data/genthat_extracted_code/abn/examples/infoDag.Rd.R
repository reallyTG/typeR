library(abn)


### Name: infoDag
### Title: Compute standard information for a DAG.
### Aliases: infoDag
### Keywords: DAG, information metric

### ** Examples


##creating a dag:
    dag <- matrix(data = c(1,0,0,0,1,0,1,0,1), nrow = 3,ncol = 3)
    dist <- list(a="gaussian",b="gaussian",c="gaussian")
    colnames(dag) <- rownames(dag) <- names(dist)
    
    infoDag(dag.m = dag)



