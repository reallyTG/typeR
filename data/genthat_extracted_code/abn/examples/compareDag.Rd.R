library(abn)


### Name: compareDag
### Title: Compare two DAGs
### Aliases: compareDag
### Keywords: DAG

### ** Examples

test.m <- matrix(data = 0,nrow = 3,ncol = 3)
    
ref.m <- matrix(data = c(0,0,0,
                          1,0,0,
                          1,0,0),nrow = 3,ncol = 3)
                          
compareDag(ref = ref.m,test = test.m)



