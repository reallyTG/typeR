library(ade4)


### Name: bca.rlq
### Title: Between-Class RLQ analysis
### Aliases: bca.rlq plot.betrlq print.betrlq
### Keywords: multivariate

### ** Examples

data(piosphere)
afcL <- dudi.coa(log(piosphere$veg + 1), scannf = FALSE)
acpR <- dudi.pca(piosphere$env, scannf = FALSE, row.w = afcL$lw)
acpQ <- dudi.hillsmith(piosphere$traits, scannf = FALSE, row.w =
  afcL$cw)
rlq1 <- rlq(acpR, afcL, acpQ, scannf = FALSE)

brlq1 <- bca(rlq1, fac = piosphere$habitat, scannf = FALSE)
brlq1
plot(brlq1)



