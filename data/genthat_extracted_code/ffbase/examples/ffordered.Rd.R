library(ffbase)


### Name: addfforder
### Title: Add the order of a ff vector of the 'ff' vector 'x'
### Aliases: addfforder ffordered ffsorted

### ** Examples

x <- ff(rnorm(10))

# adds an index to x (note the assignment)
x <- addfforder(x)

# retrieve ffindex
o <- ffordered(x)

o
# use it to sort the original vector
x[o]



