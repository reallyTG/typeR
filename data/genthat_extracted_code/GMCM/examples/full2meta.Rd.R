library(GMCM)


### Name: full2meta
### Title: Convert between parameter formats
### Aliases: full2meta meta2full

### ** Examples

theta <- GMCM:::rtheta(m = 2, d = 2)
print(par <- full2meta(theta))
print(theta.special.case <- meta2full(par, d = 2))



