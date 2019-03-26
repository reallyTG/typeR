library(systemicrisk)


### Name: Model.p.Fitness.Servedio
### Title: Multiplicative Fitness Model for Power Law
### Aliases: Model.p.Fitness.Servedio

### ** Examples

n <- 5
mf <- Model.p.Fitness.Servedio(n=n,alpha=-2.5,meandegree=0.5)
m <- Model.Indep.p.lambda(model.p=mf,
                          model.lambda=Model.lambda.GammaPrior(n,scale=1e-1))
x <- genL(m)
l <- rowSums(x$L)
a <- colSums(x$L)
res <- sample_HierarchicalModel(l,a,model=m,nsamples=10,thin=10)





