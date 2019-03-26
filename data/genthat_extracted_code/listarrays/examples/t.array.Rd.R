library(listarrays)


### Name: t.array
### Title: transpose an array
### Aliases: t.array

### ** Examples

x <- array(1:27, c(3,3,3))
tx <- t(x)
for (i in 1:3)
  for(j in 1:3)
    stopifnot(x[,j,i] == tx[i,j,])



