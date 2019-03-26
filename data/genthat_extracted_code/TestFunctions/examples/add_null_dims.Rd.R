library(TestFunctions)


### Name: add_null_dims
### Title: add_null_dims: Add null dimensions to another function. Allows
###   you to pass in input data with any number of dimensions and it will
###   only keep the first nactive.
### Aliases: add_null_dims

### ** Examples

banana(c(.1,.2))
# banana(c(.1,.2,.4,.5,.6,.7,.8)) # gives warning
add_null_dims(banana, nact=2)(c(.1,.2,.4,.5,.6,.7,.8))



