library(parsec)


### Name: is.downset
### Title: is.downset
### Aliases: is.downset

### ** Examples

z <- getzeta(var2prof(varlen = c(2, 2, 2)))

plot(z, col = 1 + c(1, 1, 0, 0, 1, 0, 0, 0) + c(0, 0, 0, 2, 0, 0, 2, 2), lwd = 2)

Q <- c(4, 7, 8)
rownames(z)[Q]
is.downset(z, Q)

Q <- c("211", "112", "111")
is.downset(z, Q)



