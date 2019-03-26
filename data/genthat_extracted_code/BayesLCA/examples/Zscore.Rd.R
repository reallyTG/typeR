library(BayesLCA)


### Name: Zscore
### Title: Evaluating Class Membership of Binary Data
### Aliases: Zscore Zscore.internal
### Keywords: blca

### ** Examples

set.seed(1)
type1 <- c(0.8, 0.8, 0.05, 0.2)
type2 <- c(0.2, 0.2, 0.05, 0.8)
x<- rlca(250, rbind(type1,type2), c(0.5,0.5))

fit <- blca.em(x, 2)
fit$Z ## Unique data types
Zscore(x, fit=fit) ## Whole data set
Zscore(c(0, 1, 1, 0), fit=fit) ## Not in data set
Zscore(x, itemprob=rbind(type1,type2), classprob=c(0.5,0.5))



