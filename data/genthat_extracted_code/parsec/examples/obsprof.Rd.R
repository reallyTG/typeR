library(parsec)


### Name: obsprof
### Title: Remove unobserved profiles.
### Aliases: obsprof obsprof.wprof

### ** Examples

prf <- var2prof(varlen = c(3, 3, 3))
prf$freq <- sample(c(0, 1), 3*3*3, replace = TRUE)
prf <- obsprof(prf)
plot(prf, shape = "equispaced")



