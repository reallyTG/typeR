## ------------------------------------------------------------------------
library(outbreaker2) 

## get all functions in an environment
x <- get_cpp_api()
x

## check content
ls(x)

## all functions are Rcpp bindings to a C++ function
x$cpp_ll_all


## ---- arguments----------------------------------------------------------

list_args <- lapply(x, args)[ls(x)]
list_args


## ------------------------------------------------------------------------

list_formals <- lapply(x, formals)
args <- sort(unique(unlist(lapply(list_formals, names))))
args


## ---- echo = FALSE-------------------------------------------------------

temp <- sub("cpp_prior_", "", ls(x, pattern = "cpp_prior.*"))
setdiff(temp, "all") 


## ---- echo = FALSE-------------------------------------------------------
temp <- sub("cpp_ll_", "", ls(x, pattern = "cpp_ll.*"))
setdiff(temp, c("timing", "all"))	    

