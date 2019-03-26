library(gss)


### Name: mkran
### Title: Generating Random Effects in Mixed-Effect Models
### Aliases: mkran mkran1
### Keywords: internal

### ** Examples

## Toy data
test <- data.frame(grp=as.factor(rep(1:2,c(2,3))))
## First formula
ran.test <- mkran(~1|grp,test)
ran.test$z
ran.test$sigma$fun(2,ran.test$sigma$env) # diag(10^(-2),2)
## Second formula
ran.test <- mkran(~grp|grp,test)
ran.test$z
ran.test$sigma$fun(c(1,2),ran.test$sigma$env) # diag(10^(-1),10^(-2))
## Clean up
## Not run: rm(test,ran.test)



