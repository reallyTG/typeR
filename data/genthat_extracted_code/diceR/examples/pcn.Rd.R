library(diceR)


### Name: pcn
### Title: Simulate and select null distributions on empirical gene-gene
###   correlations
### Aliases: pcn pcn_simulate pcn_select

### ** Examples

set.seed(9)
A <- matrix(rnorm(300), nrow = 20)
pc.dat <- pcn_simulate(A, n.sim = 50)
cl <- sample(1:4, 20, replace = TRUE)
pc.select <- pcn_select(pc.dat, cl, "rep")



