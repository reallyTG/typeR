library(TreeBUGS)


### Name: correlationPosterior
### Title: Posterior Distribution for Correlations
### Aliases: correlationPosterior

### ** Examples

# test effect of number of participants:
set.seed(123)
cors <- rbeta(50, 100, 70)
correlationPosterior(r = cors, N = 10, nCPU = 1)
correlationPosterior(r = cors, N = 100, nCPU = 1)




