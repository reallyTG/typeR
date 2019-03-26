library(permutations)


### Name: shape
### Title: Shape of a permutation
### Aliases: shape shape_cyclist shapepart shapepart_cyclist

### ** Examples

shape(rperm(10,9)) # coerced to cycle



data(megaminx)

shape(megaminx)
jj <- megaminx*megaminx[1]

stopifnot(identical(shape(jj),shape(tidy(jj))))  #tidy() does not change shape

shapepart(rperm(10,5))

shape_cyclist(list(1:4,8:9))
shapepart_cyclist(list(1:4,8:9))






