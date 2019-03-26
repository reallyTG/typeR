library(hdf5r)


### Name: H5S-class
### Title: Class for representing HDF5 spaces
### Aliases: H5S-class H5S

### ** Examples

h5s_fixed <- H5S$new("simple", dims=c(5, 2))
h5s_fixed

h5s_variable <- H5S$new("simple", dims=c(5,2), maxdims=c(Inf,2))
h5s_variable
h5s_variable$set_extent_simple(c(10,2), c(Inf, 2))
h5s_variable

# now select a subset of points
# argument evaluation has a heuristic; here it chooses point selection
h5s_variable[c(1, 3, 8), 1]
h5s_variable$get_select_type()
h5s_variable$get_select_elem_pointlist()

# and a hyperslab (chosen by the argument heuristic)
h5s_variable[2:7, 1:2]
h5s_variable$get_select_type()
h5s_variable$get_select_hyper_blocklist()



