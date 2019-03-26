## ------------------------------------------------------------------------
Y <- c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0)
Z <- c(1, 1, 1, 0, 0, 0, 0, 0, 0, 0)
dat <- data.frame(Y, Z)

## ------------------------------------------------------------------------
library(ri)

probs <- genprobexact(Z)
perms <- genperms(Z)
ate <- estate(Y, Z, prob = probs)

Ys <- genouts(Y, Z)
distout <- gendist(Ys, perms, prob = probs)
ri_out <- dispdist(distout, ate, display.plot = FALSE)

## ------------------------------------------------------------------------
library(ri2)

declaration <- declare_ra(N = 10, m = 3)
ri2_out <- conduct_ri(Y ~ Z, 
                      data = dat, 
                      declaration = declaration)


## ------------------------------------------------------------------------
ri_out$two.tailed.p.value.abs
summary(ri2_out)$two_tailed_p_value

## ------------------------------------------------------------------------
y <- c(8, 6, 2, 0, 3, 1, 1, 1, 2, 2, 0, 1, 0, 2, 2, 4, 1, 1)
Z <- c(1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0)
cluster <- c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9)
block <- c(rep(1, 4), rep(2, 6), rep(3, 8))

dat <- data.frame(y, Z, cluster, block)

## ------------------------------------------------------------------------
perms <- genperms(Z, blockvar = block, clustvar = cluster)
probs <- genprobexact(Z, blockvar = block, clustvar = cluster)
ate <- estate(y, Z, prob = probs)
  
Ys <- genouts(y, Z, ate = 0)
distout <- gendist(Ys, perms, prob = probs)
ri_out <- dispdist(distout, ate, display.plot = FALSE)

## ------------------------------------------------------------------------
block_m <- tapply(Z, block, sum) / 2
declaration <- declare_ra(blocks = block, clusters = cluster, block_m = block_m)
ri2_out <- conduct_ri(y ~ Z, declaration = declaration, data = dat)

## ------------------------------------------------------------------------
ri_out$two.tailed.p.value.abs
summary(ri2_out)$two_tailed_p_value

## ------------------------------------------------------------------------
declaration <- declare_ra(3)
obtain_permutation_matrix(declaration)

## ------------------------------------------------------------------------
genperms(Z = c(0, 0, 1))
genperms(Z = c(0, 1, 1))

