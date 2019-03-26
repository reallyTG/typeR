library(params)


### Name: check_args
### Title: Assert none of the arguemnts of a function are null.
### Aliases: check_args

### ** Examples


myfunc <- function(verbose = get_opts("verbose"), b = get_opts("b")){
  check_args()
}

set_opts(verbose = 1)
## this will throw an error, suggesting b is not defined properly
try(myfunc())





