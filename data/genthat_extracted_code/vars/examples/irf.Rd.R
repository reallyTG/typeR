library(vars)


### Name: irf
### Title: Impulse response function
### Aliases: irf print.varirf irf.varest irf.svarest irf.svecest
###   irf.vec2var
### Keywords: regression

### ** Examples

data(Canada)
## For VAR
var.2c <- VAR(Canada, p = 2, type = "const")
irf(var.2c, impulse = "e", response = c("prod", "rw", "U"), boot =
FALSE)
## For SVAR
amat <- diag(4)
diag(amat) <- NA
svar.a <- SVAR(var.2c, estmethod = "direct", Amat = amat)
irf(svar.a, impulse = "e", response = c("prod", "rw", "U"), boot =
FALSE)



