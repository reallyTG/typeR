library(algstat)


### Name: kprod
### Title: Iterated Kronecker product
### Aliases: kprod

### ** Examples

kprod(diag(2), t(ones(2)))
kprod(t(ones(2)), diag(2))

kprod(diag(2), t(ones(2)), t(ones(2)))
kprod(t(ones(2)), diag(2), t(ones(2)))
kprod(t(ones(2)), t(ones(2)), diag(2))


rbind(
  kprod(diag(2), t(ones(2))),
  kprod(t(ones(2)), diag(2))
)



