library(NCmisc)


### Name: has.method
### Title: Determine whether a function can be applied to an S4
###   class/object
### Aliases: has.method

### ** Examples

require(Matrix); require(methods)
has.method("t","dgeMatrix") # t() is the transpose method for a dgeMatrix object
has.method(t,"dgeMatrix") # also works without quotes for the method
m.example <- as(matrix(rnorm(100),ncol=5),"dgeMatrix")
has.method(t, m.example) # works with an instance of an object type too
has.method("band", m.example) # band is a function for a 'denseMatrix' but not 'dgeMatrix'
## not run # has.method("notAFunction","GRanges") # should return error
has.method("notAFunction","GRanges",TRUE) # should return FALSE and a warning



