library(geometry)


### Name: Unique
### Title: Extract Unique Rows
### Aliases: Unique
### Keywords: arith array math

### ** Examples

# `Unique' is faster than `unique'
x = matrix(sample(1:(4*8),4*8),ncol=4)
y = x[sample(1:nrow(x),3000,TRUE), ]
gc(); system.time(unique(y))
gc(); system.time(Unique(y))

#
z = Unique(y)
x[matorder(x),]
z[matorder(z),]



