library(DeclareDesign)


### Name: declare_sampling
### Title: Declare sampling procedure
### Aliases: declare_sampling sampling_handler

### ** Examples


# Default handler is `draw_rs` from `randomizr` package

# Simple random sampling
my_sampling <- declare_sampling(n = 50)

# Stratified random sampling
my_stratified_sampling <- declare_sampling(strata = female)

# Custom random sampling functions

my_sampling_function <- function(data, n=nrow(data)) {
   data[sample(n,n,replace=TRUE), , drop=FALSE]
}

my_sampling_custom <- declare_sampling(handler = my_sampling_function)

my_sampling_custom(sleep)



