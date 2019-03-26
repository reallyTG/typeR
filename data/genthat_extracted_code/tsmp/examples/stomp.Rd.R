library(tsmp)


### Name: stomp_par
### Title: Univariate STOMP algorithm
### Aliases: stomp_par stomp

### ** Examples

mp <- stomp(mp_toy_data$data[1:200, 1], window_size = 30, verbose = 0)

# using threads
mp <- stomp_par(mp_toy_data$data[1:200, 1], window_size = 30, verbose = 0)

## Not run: 
##D ref_data <- mp_toy_data$data[, 1]
##D query_data <- mp_toy_data$data[, 2]
##D # self similarity
##D mp <- stomp(ref_data, window_size = 30)
##D # join similarity
##D mp <- stomp(ref_data, query_data, window_size = 30)
## End(Not run)



