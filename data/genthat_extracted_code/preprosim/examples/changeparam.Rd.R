library(preprosim)


### Name: changeparam
### Title: Change simulation control parameter object
### Aliases: changeparam

### ** Examples

pa <- newparam(iris)
pa <- changeparam(pa, "noise", "cols", value=1)
pa <- changeparam(pa, "noise", "param", value=c(0,0.1))
pa <- changeparam(pa, "noise", "order", value=1)



