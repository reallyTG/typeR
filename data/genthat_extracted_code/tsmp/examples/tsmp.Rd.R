library(tsmp)


### Name: tsmp
### Title: Computes the Matrix Profile and Profile Index
### Aliases: tsmp

### ** Examples

# default with [stomp()]
mp <- tsmp(mp_toy_data$data[1:200, 1], window_size = 30, verbose = 0)

# parallel with [stomp_par()]
mp <- tsmp(mp_toy_data$data[1:200, 1], window_size = 30, n_workers = 2, verbose = 0)

# Anytime STAMP
mp <- tsmp(mp_toy_data$data[1:200, 1], window_size = 30, mode = "stamp", s_size = 50, verbose = 0)

# [mstomp()]
mp <- tsmp(mp_toy_data$data[1:200, ], window_size = 30, mode = "mstomp", verbose = 0)

# [simple_fast()]
mp <- tsmp(mp_toy_data$data[1:200, ], window_size = 30, mode = "simple", verbose = 0)



