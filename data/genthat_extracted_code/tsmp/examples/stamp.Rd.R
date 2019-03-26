library(tsmp)


### Name: stamp_par
### Title: Anytime univariate STAMP algorithm Parallel version
### Aliases: stamp_par stamp

### ** Examples

mp <- stamp(mp_toy_data$data[1:200, 1], window_size = 30, verbose = 0)

# using threads
mp <- stamp_par(mp_toy_data$data[1:200, 1], window_size = 30, verbose = 0)

## Not run: 
##D ref_data <- mp_toy_data$data[, 1]
##D query_data <- mp_toy_data$data[, 2]
##D # self similarity
##D mp <- stamp(ref_data, window_size = 30, s_size = round(nrow(ref_data) * 0.1))
##D # join similarity
##D mp <- stamp(ref_data, query_data, window_size = 30, s_size = round(nrow(query_data) * 0.1))
## End(Not run)



