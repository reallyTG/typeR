library(MSEtool)


### Name: HCR_ramp
### Title: Ramped harvest control rules
### Aliases: HCR_ramp HCR40_10 HCR60_20

### ** Examples

# 40-10 linear ramp
Brel <- seq(0, 1, length.out = 200)
plot(Brel, HCRlin(Brel, 0.1, 0.4), xlab = "Estimated SSB/SSB0",
ylab = "TAC adjustment factor", main = "40-10 harvest control rule",
type = "l", col = "blue")
abline(v = c(0.1, 0.4), col = "red", lty = 2)

# create a 40-10 MP to run in closed-loop MSE
DD_40_10 <- make_MP(DD_TMB, HCR40_10)

# Alternatively,
DD_40_10 <- make_MP(DD_TMB, HCR_ramp, LRP = 0.1, TRP = 0.4)

# An SCA with LRP and TRP at 0.4 and 0.8, respectively, of SSB/SSBMSY
SCA_80_40 <- make_MP(SCA, HCR_ramp, LRP = 0.4, TRP = 0.8, RP_type = "SSB_SSBMSY")

## Not run: 
##D myOM <- DLMtool::runMSE(DLMtool::testOM, MPs = c("FMSYref", "DD_40_10"))
## End(Not run)



