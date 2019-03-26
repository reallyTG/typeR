library(flexmix)


### Name: FLXMCmvnorm
### Title: FlexMix Clustering Demo Driver
### Aliases: FLXMCmvnorm FLXMCnorm1 FLXmclust
### Keywords: cluster

### ** Examples

data("Nclus", package = "flexmix")

require("MASS")
eqscplot(Nclus)

## This model is wrong (one component has a non-diagonal cov matrix)
ex1 <- flexmix(Nclus ~ 1, k = 4, model = FLXMCmvnorm())
print(ex1)
plotEll(ex1, Nclus)

## True model, wrong number of components
ex2 <- flexmix(Nclus ~ 1, k = 6, model = FLXMCmvnorm(diagonal = FALSE))  
print(ex2)

plotEll(ex2, Nclus)

## Get parameters of first component
parameters(ex2, component = 1)

## Have a look at the posterior probabilies of 10 random observations
ok <- sample(1:nrow(Nclus), 10)
p  <- posterior(ex2)[ok, ]
p

## The following two should be the same
max.col(p)
clusters(ex2)[ok]
## Don't show: 
  stopifnot(all.equal(max.col(p), clusters(ex2)[ok]))
## End(Don't show)
## Now try the univariate case
plot(density(Nclus[, 1]))

ex3 <- flexmix(Nclus[, 1] ~ 1, cluster = cut(Nclus[, 1], 3),
               model = FLXMCnorm1())
ex3
parameters(ex3)



