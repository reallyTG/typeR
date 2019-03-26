library(phase1PRMD)


### Name: eff_suggest
### Title: Suggest the input 'eff.structure' of function 'SimPRMD' with
###   selected 'eff.sd_tran'
### Aliases: eff_suggest

### ** Examples

# Provide an target efficacy mean matrix for all dose and cycles
eff.M <- matrix(rep(3:8/10, 6), nrow = 6, ncol = 6)

# Give a target standard deviation matrix for all dose and cycles
# Notice that the generated efficacy may have difference standard deviation
# matrix due to the correlations across cycles
eff.sd <- matrix(0.2, nrow = 6, ncol = 6)

# Select a eff.sd_trans for testing. The efficacy variance are mainly
# controlled by the eff.sd_trans
eff.sd_trans <- 1.5  # or other positive value
eff.structure <- eff_suggest(eff.M = eff.M, eff.sd = eff.sd,
                             eff.sd_trans = eff.sd_trans)

# check whether the suggested eff.M and the selected sd_trans
# generate the desirable scenario
eff.Sigma <- diag(6)
diag(eff.Sigma[-1,]) = 0.5
diag(eff.Sigma[, -1]) = 0.5
eff.check <- eff_summary(eff.structure = eff.structure,
                         eff.Sigma = eff.Sigma,
                         eff.sd_trans = eff.sd_trans,
                         plot.flag = FALSE)
eff.check$eff.M
eff.check$eff.cor.ls





