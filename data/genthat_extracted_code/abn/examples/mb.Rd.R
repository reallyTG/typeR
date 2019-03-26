library(abn)


### Name: mb
### Title: Compute the Markov blanket
### Aliases: mb

### ** Examples

#defining distribution
dist <- list(a="gaussian",b="gaussian",c="gaussian",d="gaussian", e="binomial", 
               f="binomial")
    
    #define parameter matrix 
    dag <- matrix(data = c(0,1,1,0,1,0,
    0,0,1,1,0,1, 
    0,0,0,0,0,0, 
    0,0,0,0,0,0, 
    0,0,0,0,0,1, 
    0,0,0,0,0,0),nrow = 6L,ncol = 6L,byrow = TRUE)
    
    colnames(dag) <- rownames(dag) <- names(dist)
    
    mb(dag.m = dag,node = "b",data.dists = dist)
    mb(dag.m = dag,node = "e",data.dists = dist)
    mb(dag.m = dag,node = c("b","e"),data.dists = dist)




