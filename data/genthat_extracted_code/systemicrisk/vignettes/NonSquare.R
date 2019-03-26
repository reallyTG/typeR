## ------------------------------------------------------------------------
library(systemicrisk)

## ------------------------------------------------------------------------
set.seed(1230)
l <- rexp(10,rate=5/4)
l
a <- rexp(4);
a <- a/sum(a)*sum(l)
a

## ------------------------------------------------------------------------
mod <- Model.Indep.p.lambda(model.p=Model.p.constant(p=matrix(0.5,nrow=10,ncol=4)),
                            model.lambda=Model.lambda.constant(lambda=matrix(5,nrow=10,ncol=4)))

## ------------------------------------------------------------------------
res <- sample_HierarchicalModel(l=l,a=a,model=mod,nsamples=10,silent=TRUE)

## ------------------------------------------------------------------------
res$L[[1]]
res$L[[2]]

