library(HLMdiag)


### Name: HLMresid.default
### Title: Calculating residuals from HLMs
### Aliases: HLMresid HLMresid.default HLMresid.lmerMod HLMresid.mer
### Keywords: models regression

### ** Examples

library(lme4)
fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)

# level-1 residuals
all.equal(HLMresid(object = fm1, level = 1, type = "EB"), resid(fm1)) ## EB
r1LS <- HLMresid(object = fm1, level = 1, type = "LS") ## raw LS resids
head(r1LS)
r1LS.std <- HLMresid(object = fm1, level = 1, type = "LS", standardize = TRUE) ## std. LS resids
head(r1LS.std)

# level-2 residuals
all.equal(r2EB <- HLMresid(object = fm1, level = "Subject", type = "EB"), ranef(fm1)[["Subject"]])
r2EB.std <- HLMresid(object = fm1, level = "Subject", type = "EB", standardize = TRUE)
head(r2EB)
head(r2EB.std)

# marginal residuals
mr <- HLMresid(object = fm1, level = "marginal")
cholr <- HLMresid(object = fm1, level = "marginal", standardize = TRUE) # Cholesky residuals



