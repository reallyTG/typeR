library(pvar)


### Name: IsEqualPvar
### Title: Test if two 'pvar' objects are equivalent.
### Aliases: IsEqualPvar

### ** Examples

x <- rwiener(100)
pv1 <- pvar(x, 2)
pv2 <- pvar(x[1:50], 2) + pvar(x[50:101], 2)
IsEqualPvar(pv1, pv2)



