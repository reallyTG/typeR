library(lsbclust)


### Name: sim_lsbclust
### Title: Simulate and Analyze LSBCLUST
### Aliases: sim_lsbclust

### ** Examples

set.seed(1)
res <- sim_lsbclust(ndata = 5, nobs = 100, size = c(10, 8), nclust = rep(5, 4), 
                    verbose = 0, nstart_T3 = 2, nstart_ak = 1, parallel_data = FALSE,
                    nstart = 2, nstart.kmeans = 5 )




