library(parsec)


### Name: is.linext
### Title: is.linext
### Aliases: is.linext

### ** Examples

Z <- getzeta(var2prof(varlen = c(3, 3)))
ranks <- c(1, 4, 2, 3, 5, 7, 6, 8, 9)
names(ranks) <- rownames(Z)
ranks
is.linext(order = ranks, z = Z)



