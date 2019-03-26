library(cpgen)


### Name: get_num_threads
### Title: Get the number of threads for 'cpgen'
### Aliases: get_num_threads
### Keywords: Parallelization

### ** Examples


# set the number of threads to 1
set_num_threads(1)

# check
get_num_threads()

# set number of threads to the value reported by get_max_threads()
n_threads <- get_max_threads()
set_num_threads(n_threads)

# check
get_num_threads()





