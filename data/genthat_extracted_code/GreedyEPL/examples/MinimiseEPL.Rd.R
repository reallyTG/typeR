library(GreedyEPL)


### Name: MinimiseEPL
### Title: MinimiseEPL
### Aliases: MinimiseEPL

### ** Examples

set.seed(123)
N <- 10
niter <- 50
Kup <- 3
sample_of_partitions <- matrix(sample(x = 1:Kup, size = niter*N, replace = TRUE),niter,N)
loss_type = "VI"
output <- MinimiseEPL(sample_of_partitions, list(Kup = Kup, loss_type = loss_type))
output$decision
output$EPL



