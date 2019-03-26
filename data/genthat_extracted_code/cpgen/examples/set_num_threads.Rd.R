library(cpgen)


### Name: set_num_threads
### Title: Set the number of OpenMP threads used by the functions of
###   package 'cpgen'
### Aliases: set_num_threads
### Keywords: Parallelization

### ** Examples


# Control the number of threads being used in an R-session:

# set the number of threads to 1
## Not run: 
##D set_num_threads(1)
##D 
##D #### Use a parallelized cpgen-function
##D 
##D # generate random data
##D rand_data(1000,10000)
##D 
##D # check single-threaded performance
##D system.time(W <- M%c%t(M))
##D 
##D # set number of threads to 2
##D 
##D set_num_threads(2)
##D 
##D # check multi-threaded performance
##D system.time(W <- M%c%t(M))
## End(Not run)




