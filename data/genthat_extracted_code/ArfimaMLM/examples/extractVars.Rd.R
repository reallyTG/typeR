library(ArfimaMLM)


### Name: extractVars
### Title: Extract and order variables from formula
### Aliases: extractVars
### Keywords: internal

### ** Examples


f1 <- y ~ x1.xdif + x2 + z1.fd + z2
f2 <- y.ydif ~ x1.xdif + x2 + z1.fd + z2.fd + (1+x1.xdif|time)
f3 <- y.mean ~ x1.mean

extractVars(formula = f1)
extractVars(formula = f2, ecmformula = f3)




