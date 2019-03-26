library(networktree)


### Name: networktree
### Title: networktree: Partitioning of network models
### Aliases: networktree networktree.default networktree.formula

### ** Examples


set.seed(1)
d <- data.frame(trend = 1:200, foo = runif(200, -1, 1))
d <- cbind(d, rbind(
  mvtnorm::rmvnorm(100, mean = c(0, 0, 0),
          sigma = matrix(c(1, 0.5, 0.5, 0.5, 1, 0.5, 0.5, 0.5, 1), ncol = 3)),
  mvtnorm::rmvnorm(100, mean = c(0, 0, 0),
          sigma = matrix(c(1, 0, 0.5, 0, 1, 0.5, 0.5, 0.5, 1), ncol = 3))
))
colnames(d)[3:5] <- paste0("y", 1:3)

## Now use the function
tree1 <- networktree(nodevars=d[,3:5], splitvars=d[,1:2])

## Formula interface
tree2 <- networktree(y1 + y2 + y3 ~ trend + foo, data=d)

## No test: 
## Conditional version
tree3 <- networktree(nodevars=d[,3:5], splitvars=d[,1:2], 
                     method="ctree")

## Change control arguments
tree4 <- networktree(nodevars=d[,3:5], splitvars=d[,1:2],
                     alpha=0.01)
## End(No test)



