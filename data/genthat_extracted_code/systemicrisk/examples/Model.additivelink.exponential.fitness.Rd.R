library(systemicrisk)


### Name: Model.additivelink.exponential.fitness
### Title: Fitness model for liabilities matrix
### Aliases: Model.additivelink.exponential.fitness

### ** Examples

mod <- Model.additivelink.exponential.fitness(10,alpha=-2.5,beta=0.1,
                lambdaprior=Model.fitness.genlambdaparprior(ratescale=1e3))
theta <- mod$rtheta()
L <- genL(mod)
l <- rowSums(L$L)
a <- colSums(L$L)
## increase number of samples and thinning in real examples
res <- sample_HierarchicalModel(l=l,a=a,model=mod,nsamples=4,thin=50)
mod$accrates()



