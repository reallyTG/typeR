library(Surrogate)


### Name: AA.MultS
### Title: Compute the multiple-surrogate adjusted association
### Aliases: AA.MultS
### Keywords: Adjusted Association Causal-Inference framework
###   Counterfactuals Single-trial setting Sensitivity ICA Multiple
###   surrogates

### ** Examples

data(ARMD.MultS)

# Regress T on Z, S1 on Z, ..., Sk on Z 
# (to compute the covariance matrix of the residuals)
Res_T <- residuals(lm(Diff52~Treat, data=ARMD.MultS))
Res_S1 <- residuals(lm(Diff4~Treat, data=ARMD.MultS))
Res_S2 <- residuals(lm(Diff12~Treat, data=ARMD.MultS))
Res_S3 <- residuals(lm(Diff24~Treat, data=ARMD.MultS))
Residuals <- cbind(Res_T, Res_S1, Res_S2, Res_S3)

# Make covariance matrix of residuals, Sigma_gamma
Sigma_gamma <- cov(Residuals)

# Conduct analysis
Result <- AA.MultS(Sigma_gamma = Sigma_gamma, N = 188, Alpha = .05)

# Explore results
summary(Result)



