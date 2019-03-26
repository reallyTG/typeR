library(sanon)


### Name: coef.sanon
### Title: Extract Model Coefficients
### Aliases: coef.sanon

### ** Examples

##### Example 3.1 Randomized Clinical Trial of Chronic Pain #####
data(cpain)
out1 = sanon(response ~ grp(treat, ref="placebo") + strt(center) + strt(diagnosis), data=cpain)
coef(out1)
coefficients(out1)

##### Example 3.2 Randomized Clinical Trial of Respiratory Disorder #####
data(resp)
P = rbind(rep(0, 4), diag(4), rep(0, 4))
out23 = sanon(cbind(baseline, visit1, visit2, visit3, visit4) ~ grp(treatment, ref="P")
 + strt(center) + strt(sex) + covar(age), data=resp, P=P)
# each four visits
coef(out23)
coefficients(out23)



