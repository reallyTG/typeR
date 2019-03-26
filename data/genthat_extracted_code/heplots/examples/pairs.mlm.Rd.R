library(heplots)


### Name: pairs.mlm
### Title: Pairwise HE Plots
### Aliases: pairs.mlm
### Keywords: hplot multivariate

### ** Examples

# ANCOVA, assuming equal slopes
rohwer.mod <- lm(cbind(SAT, PPVT, Raven) ~ SES + n + s + ns + na + ss, data=Rohwer)

# View all pairs, with ellipse for all 5 regressors
pairs(rohwer.mod, hypotheses=list("Regr" = c("n", "s", "ns", "na", "ss")))




