library(CRPClustering)


### Name: crp_gibbs
### Title: Markov chain Monte Carlo methods for CRP clustering
### Aliases: crp_gibbs

### ** Examples

data <- matrix(c(1.8,1.9,2.1,2.5,5.6,5.2,6,6.1), 4, 2)
z_result <- crp_gibbs(
                      data,
                      mu=c(0,0),
                      sigma_table=14,
                      alpha=0.3,
                      ro_0=0.1,
                      burn_in=10,
                      iteration=100
                     )



