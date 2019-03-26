library(MXM)


### Name: Partial correlation between two variables
### Title: Partial correlation
### Aliases: partialcor
### Keywords: Partial correlation Conditioning set

### ** Examples

r <- cor( iris[, 1:4] )
partialcor(r, 1, 2, 0, 150) 
r[1, 2]  ## the same as above

y = as.vector( iris[, 1] )
x = as.vector( iris[, 2] )
z = as.vector( iris[, 3] )
e1 = resid( lm(y ~ z) )
e2 = resid( lm(x ~ z) )
cor(e1, e2)
partialcor(r, 1,2, 3, 150)



