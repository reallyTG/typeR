library(rugarch)


### Name: multispec-methods
### Title: function: Univariate multiple GARCH Specification
### Aliases: multispec multispec-methods multispec,ANY-method
###   multispec,vector-method
### Keywords: methods

### ** Examples

# how to make a list with 2 uGARCHspec objects of the same type
spec = ugarchspec()
mspec = multispec( replicate(2, spec) )
# note that replicate(spec, 2) does not work...be careful about the order 
# else explicity name 'n' (i.e. n = 2)

# or simply combine disparate objects
spec1 = ugarchspec(distribution = "norm")
spec2 = ugarchspec(distribution = "std")
mspec = multispec( c( spec1, spec2 ) )



