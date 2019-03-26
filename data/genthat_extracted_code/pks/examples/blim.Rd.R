library(pks)


### Name: blim
### Title: Basic Local Independence Models (BLIMs)
### Aliases: blim blimMD anova.blim coef.blim deviance.blim logLik.blim
###   nobs.blim
### Keywords: models

### ** Examples

data(DoignonFalmagne7)
K   <- DoignonFalmagne7$K    # knowledge structure
N.R <- DoignonFalmagne7$N.R  # frequencies of response patterns

## Fit basic local independence model (BLIM) by different methods
blim(K, N.R, method = "MD")    # minimum discrepancy estimation
blim(K, N.R, method = "ML")    # maximum likelihood estimation by EM
blim(K, N.R, method = "MDML")  # MDML estimation

## Parameter restrictions: beta_a = beta_b = beta_d, beta_c = beta_e
##                          eta_a =  eta_b = 0.1
m1 <- blim(K, N.R, method = "ML",
           betaequal = list(c(1, 2, 4), c(3, 5)),
              etafix = c(0.1, 0.1, NA, NA, NA))
m2 <- blim(K, N.R, method = "ML")
anova(m1, m2)

## See ?endm, ?probability, and ?chess for further examples.



