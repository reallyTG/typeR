library(systemicrisk)


### Name: sample_HierarchicalModel
### Title: Sample from Hierarchical Model with given Row and Column Sums
### Aliases: sample_HierarchicalModel

### ** Examples

n <- 10
m <- Model.Indep.p.lambda(Model.p.BetaPrior(n),
                          Model.lambda.GammaPrior(n,scale=1e-1))
x <- genL(m)
l <- rowSums(x$L)
a <- colSums(x$L)
## Not run: 
##D res <- sample_HierarchicalModel(l,a,model=m)
## End(Not run)
# fixing one values
L_fixed <- matrix(NA,ncol=n,nrow=n)
L_fixed[1,2:5] <- x$L[1,2:5]
## Not run: 
##D res <- sample_HierarchicalModel(l,a,model=m,L_fixed=L_fixed,
##D                                 nsamples=1e2)
##D sapply(res$L,function(x)x[1,2:5])
## End(Not run)




