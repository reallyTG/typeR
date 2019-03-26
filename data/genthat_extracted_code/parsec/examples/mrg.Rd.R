library(parsec)


### Name: mrg
### Title: Merge posets
### Aliases: mrg mrg.character mrg.incidence

### ** Examples

# Example with lst as list of incidence matrices
Lambda <- getlambda(A < B, C < D)
plot(Lambda)
lst <- LE(Lambda)
vl <- c(A = 2, B = 2, C = 2, D = 2)
lstZeta <- LE2incidence(lst, varlen = vl)
for (x in lstZeta)
    plot(x)
mrg(lstZeta)

# Example with lst as list of characters
Lambda <- getlambda(A < B, C < D)
lst <- LE(Lambda)
vl <- c(A = 2, B = 2, C = 2, D = 2)
Zeta <- mrg(lst, varlen = vl)
plot(Zeta)



