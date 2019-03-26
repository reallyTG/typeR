library(lambda.tools)


### Name: map
### Title: Apply a function over each element of a vector
### Aliases: map

### ** Examples

map(-10:10, quantize)

# Output a list instead of a vector
map(-10:10, quantize, acc=list())

# Sum the columns of a matrix
map(matrix(1:24, ncol=4), sum)

# Sum the columns of a data.frame
map(data.frame(a=1:6, b=7:12, c=13:18, d=19:24), sum)




