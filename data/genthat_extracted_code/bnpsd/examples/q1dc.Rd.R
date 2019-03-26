library(bnpsd)


### Name: q1dc
### Title: Construct admixture proportion matrix for circular 1D geography
### Aliases: q1dc

### ** Examples

## admixture matrix for 1000 individuals drawing alleles from 10 subpops
## and a spread of about 2 standard deviations along the circular 1D geography
Q <- q1dc(n=1000, k=10, sigma=2)

## a similar model but with a bias coefficient "s" of exactly 1/2
k <- 10
F <- 1:k # Fst vector for intermediate subpops, up to a factor (will be rescaled below)
Fst <- 0.1 # desired final Fst of admixed individuals
obj <- q1dc(n=1000, k=k, s=0.5, F=F, Fst=Fst)
## in this case return value is a named list with three items:
Q <- obj$Q # admixture proportions
F <- obj$F # rescaled Fst vector for intermediate subpops
sigma <- obj$sigma # and the sigma that gives the desired s and final Fst




