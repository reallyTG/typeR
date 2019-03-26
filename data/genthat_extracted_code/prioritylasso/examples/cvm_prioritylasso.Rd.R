library(prioritylasso)


### Name: cvm_prioritylasso
### Title: prioritylasso with several block specifications
### Aliases: cvm_prioritylasso

### ** Examples

cvm_prioritylasso(X = matrix(rnorm(50*500),50,500), Y = rnorm(50), family = "gaussian",
                  type.measure = "mse", lambda.type = "lambda.min", nfolds = 5,
                  blocks.list = list(list(bp1=1:75, bp2=76:200, bp3=201:500),
                                     list(bp1=1:75, bp2=201:500, bp3=76:200)))
## Not run: 
##D cvm_prioritylasso(X = pl_data[,1:1028], Y = pl_data[,1029], family = "binomial",
##D                   type.measure = "auc", standardize = FALSE, block1.penalization = FALSE,
##D                   blocks.list = list(list(1:4, 5:9, 10:28, 29:1028),
##D                                      list(1:4, 5:9, 29:1028, 10:28)),
##D                   max.coef.list = list(c(Inf, Inf, Inf, 10), c(Inf, Inf, 10, Inf)))
## End(Not run)




