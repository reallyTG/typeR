library(tsmp)


### Name: salient_subsequences
### Title: Framework for retrieve salient subsequences from a dataset
### Aliases: salient_subsequences

### ** Examples

# toy example
data <- mp_toy_data$data[, 1]
mp <- tsmp(data, window_size = 30, verbose = 0)
mps <- salient_subsequences(mp, data, verbose = 0)

## Not run: 
##D # full example
##D data <- mp_meat_data$sub$data
##D w <- mp_meat_data$sub$sub_len
##D mp <- tsmp(data, window_size = w, verbose = 2, n_workers = 6)
##D mps <- salient_subsequences(mp, data, n_bits = c(4, 6, 8), verbose = 2)
## End(Not run)




