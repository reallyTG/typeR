library(sanon)


### Name: contrast
### Title: Contrast for Model Parameters
### Aliases: contrast print.contrast

### ** Examples

##### Example 3.2 Randomized Clinical Trial of Respiratory Disorder #####
data(resp)
P = rbind(rep(0, 4), diag(4), rep(0, 4))
out23 = sanon(cbind(baseline, visit1, visit2, visit3, visit4) ~ grp(treatment, ref="P")
 + strt(center) + strt(sex) + covar(age), data=resp, P=P)

# Homogeneity of the xi_k across the four visits
contrast(out23, C=cbind(diag(3), rep(-1, 3)))

# Comparison between treatments for the average of the xi_k across the 4 visits
contrast(out23, C=matrix(rep(1, 4)/4, ncol=4))



