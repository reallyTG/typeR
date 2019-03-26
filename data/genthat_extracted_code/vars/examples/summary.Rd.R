library(vars)


### Name: summary
### Title: Summary method for objects of class varest, svarest and svecest
### Aliases: summary summary.varest summary.svarest summary.svecest
###   print.varsum print.svarsum print.svecsum
### Keywords: regression

### ** Examples

data(Canada)
## summary-method for varest
var.2c <- VAR(Canada, p = 2 , type = "const")
summary(var.2c)
## summary-method for svarest
amat <- diag(4)
diag(amat) <- NA
amat[2, 1] <- NA
amat[4, 1] <- NA
## Estimation method scoring
svar.a <- SVAR(x = var.2c, estmethod = "scoring", Amat = amat, Bmat = NULL,
max.iter = 100, maxls = 1000, conv.crit = 1.0e-8)
summary(svar.a)
## summary-method for svecest
vecm <- ca.jo(Canada[, c("prod", "e", "U", "rw")], type = "trace",
              ecdet = "trend", K = 3, spec = "transitory")
SR <- matrix(NA, nrow = 4, ncol = 4)
SR[4, 2] <- 0
LR <- matrix(NA, nrow = 4, ncol = 4)
LR[1, 2:4] <- 0
LR[2:4, 4] <- 0
svec.b <- SVEC(vecm, LR = LR, SR = SR, r = 1, lrtest = FALSE, boot =
FALSE)
summary(svec.b) 



