library(docopulae)


### Name: rowmatch
### Title: Row Matching
### Aliases: rowmatch

### ** Examples

a = as.matrix(expand.grid(as.double(2:3), as.double(3:6)))
a = a[sample(nrow(a)),]
a

b = as.matrix(expand.grid(as.double(3:4), as.double(2:5)))
b = b[sample(nrow(b)),]
b

i = rowmatch(a, b)
i
b[na.omit(i),] # matching rows
a[is.na(i),] # non matching rows



