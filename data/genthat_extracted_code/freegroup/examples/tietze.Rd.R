library(freegroup)


### Name: tietze
### Title: Tietze form for free group objects
### Aliases: tietze Tietze tietze.matrix tietze.free vec_to_matrix

### ** Examples

tietze(rfree(10,3))

vec_to_matrix(c(1,3,-1,-1,-1,2))

as.free(list(c(1,1,8),c(2,-4,-4)))

all(as.free(tietze(abc(1:30)))== abc(1:30))




