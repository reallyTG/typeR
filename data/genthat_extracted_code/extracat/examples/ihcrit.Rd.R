library(extracat)


### Name: WBCI
### Title: The Weighted Bertin Classification Index
### Aliases: WBCI

### ** Examples

M <-arsim(1000, c(12,12), 3)
BCI(M)
WBCI(M)


M2 <- optile(M, iter = 100)
BCI(M2)
WBCI(M2)

M3 <- optile(M, fun = "WBCC", iter = 100)
BCI(M3)
WBCI(M3)



