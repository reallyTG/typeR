library(sanon)


### Name: summary.sanon
### Title: Summarizing Weighted Least Squares Fits
### Aliases: print.summary.sanon summary.sanon

### ** Examples

##### Example 3.1 Randomized Clinical Trial of Chronic Pain #####
data(cpain)
sum1 = summary(sanon(response ~ grp(treat, ref="placebo") + strt(center) + strt(diagnosis)
, data=cpain))
sum1

##### Example 3.2 Randomized Clinical Trial of Respiratory Disorder #####
data(resp)
sum22 = summary(sanon(cbind(baseline, visit1, visit2, visit3, visit4)
~ grp(treatment, ref="P") + strt(center) + strt(sex) + covar(age), data=resp))
sum22



