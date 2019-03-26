library(sanon)


### Name: sanon
### Title: Non-Parametric Covariable Adjustment for Stratified Rank
###   Measures of Association
### Aliases: print.sanon sanon sanon.default sanon.formula

### ** Examples

##### Example 3.1 Randomized Clinical Trial of Chronic Pain #####
data(cpain)
out11 = sanon(response ~ grp(treat, ref="placebo") + strt(center) + strt(diagnosis), data=cpain)
out11
summary(out11)

# R objects are also available
attach(cpain)
out12 = sanon(outcome=response, group=treat,
strt=cbind(center, diagnosis), ref="placebo")
out12
summary(out12)

##### Example 3.2 Randomized Clinical Trial of Respiratory Disorder #####
data(resp)
out21 = sanon(cbind(baseline, visit1, visit2, visit3, visit4)
~ grp(treatment, ref="P") + strt(center) + strt(sex) + covar(age), data=resp)
out21
summary(out21)

# the matrix P can be specified
P = rbind(rep(0, 4), diag(4), rep(0, 4))
out22 = sanon(cbind(baseline, visit1, visit2, visit3, visit4)
~ grp(treatment, ref="P") + strt(center) + strt(sex) + covar(age), data=resp, P=P)
out22
summary(out22)



