library(mrgsolve)


### Name: modMATRIX
### Title: Create a matrix
### Aliases: modMATRIX

### ** Examples

modMATRIX("1 2.2 333")
modMATRIX("1 1.1 2.2", block=TRUE)
modMATRIX("23 234 234 5234", use=FALSE)

ans <- modMATRIX("1.1 0.657 2.2", correlation=TRUE, block=TRUE)
ans
cov2cor(ans)




