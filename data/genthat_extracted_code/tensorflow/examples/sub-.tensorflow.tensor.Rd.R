library(tensorflow)


### Name: [.tensorflow.tensor
### Title: Subset tensors with '['
### Aliases: [.tensorflow.tensor

### ** Examples

## Not run: 
##D sess <- tf$Session()
##D 
##D x <- tf$constant(1:15, shape = c(3, 5))
##D sess$run(x)
##D # by default, numerics supplied to `...` are interperted R style
##D sess$run( x[,1] )# first column
##D sess$run( x[1:2,] ) # first two rows
##D sess$run( x[,1, drop = FALSE] )
##D 
##D # strided steps can be specified in R syntax or python syntax
##D sess$run( x[, seq(1, 5, by = 2)] )
##D sess$run( x[, 1:5:2] )
##D # if you are unfamiliar with python-style strided steps, see:
##D # https://docs.scipy.org/doc/numpy-1.13.0/reference/arrays.indexing.html#basic-slicing-and-indexing
##D 
##D # missing arguments for python syntax are valid, but they must by backticked
##D # or supplied as NULL
##D sess$run( x[, `::2`] )
##D sess$run( x[, NULL:NULL:2] )
##D sess$run( x[, `2:`] )
##D 
##D # Another python features that is available is a python style ellipsis `...`
##D # (not to be confused with R dots `...`)
##D # a all_dims() expands to the shape of the tensor
##D y <- tf$constant(1:(3^5), shape = c(3,3,3,3,3))
##D identical(
##D   sess$run( y[all_dims(), 1] ),
##D   sess$run( y[,,,,1] )
##D   )
##D 
##D # tf$newaxis are valid
##D sess$run( x[,, tf$newaxis] )
##D 
##D # negative numbers are always interperted python style
##D # The first time a negative number is supplied to `[`, a warning is issued
##D # about the non-standard behavior.
##D sess$run( x[-1,] ) # last row, with a warning
##D sess$run( x[-1,] )# the warning is only issued once
##D 
##D # specifying `style = 'python'` changes the following:
##D # +  zero-based indexing is used
##D # +  slice sequences in the form of `start:stop` do not include `stop`
##D #    in the returned value
##D # +  out-of-bounds indices in a slice are valid
##D 
##D # The style argument can be supplied to individual calls of `[` or set
##D # as a global option
##D 
##D # example of zero based  indexing
##D sess$run( x[0, , style = 'python'] ) # first row
##D sess$run( x[1, , style = 'python'] ) # second row
##D 
##D # example of slices with exclusive stop
##D options(tensorflow.extract.style = 'python')
##D sess$run( x[, 0:1] ) # just the first column
##D sess$run( x[, 0:2] ) # first and second column
##D 
##D # example of out-of-bounds index
##D sess$run( x[, 0:10] )
##D options(tensorflow.extract.style = NULL)
##D 
##D # slicing with tensors is valid too, but note, tensors are never
##D # translated and are always interperted python-style.
##D # A warning is issued the first time a tensor is passed to `[`
##D sess$run( x[, tf$constant(0L):tf$constant(2L)] )
##D # just as in python, only scalar tensors are valid
##D # https://www.tensorflow.org/api_docs/python/tf/Tensor#__getitem__
##D 
##D # To silence the warnings about tensors being passed as-is and negative numbers
##D # being interperted python-style, set
##D options(tensorflow.extract.style = 'R')
##D 
##D # clean up from examples
##D options(tensorflow.extract.style = NULL)
## End(Not run)



