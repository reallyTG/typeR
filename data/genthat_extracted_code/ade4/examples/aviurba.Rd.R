library(ade4)


### Name: aviurba
### Title: Ecological Tables Triplet
### Aliases: aviurba
### Keywords: datasets

### ** Examples

data(aviurba)
a1 <- dudi.coa(aviurba$fau, scan = FALSE, nf=4)
a2 <- dudi.acm(aviurba$mil, row.w = a1$lw, scan = FALSE, nf = 4)
plot(coinertia(a1, a2, scan = FALSE))



