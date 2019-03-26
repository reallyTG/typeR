library(HLMdiag)


### Name: compare_eb_ls
### Title: Visually comparing shrinkage and LS estimates
### Aliases: compare_eb_ls

### ** Examples

library(lme4)
wages.fm1 <- lmer(lnw ~ exper + (exper | id), data = wages)
wages.sepLM <- adjust_lmList(lnw ~ exper | id, data = wages)
rancoef.eb <- coef(wages.fm1)$id
rancoef.ols <- coef(wages.sepLM) # note diff. length than rancoef.eb
compare_eb_ls(eb = rancoef.eb[rownames(rancoef.ols),], ols = rancoef.ols, identify = 0.01)



