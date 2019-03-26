library(tsmp)


### Name: mstomp_par
### Title: Multivariate STOMP algorithm Parallel version
### Aliases: mstomp_par mstomp

### ** Examples

# using all dimensions
mp <- mstomp(mp_toy_data$data[1:200,], 30, verbose = 0)

# using threads
mp <- mstomp_par(mp_toy_data$data[1:200,], 30, verbose = 0)

## Not run: 
##D # force using dimensions 1 and 2
##D mp <- mstomp(mp_toy_data$data[1:200,], 30, must_dim = c(1, 2))
##D # exclude dimensions 2 and 3
##D mp <- mstomp(mp_toy_data$data[1:200,], 30, exc_dim = c(2, 3))
## End(Not run)



