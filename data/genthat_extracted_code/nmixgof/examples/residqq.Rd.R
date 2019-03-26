library(nmixgof)


### Name: residqq
### Title: Qq plot of randomized quantile residuals against standard normal
###   quantiles
### Aliases: residqq

### ** Examples

library(unmarked)
umf = unmarkedFramePCount(y = shoveler$y, obsCovs = shoveler$obs, siteCovs = shoveler$site)
fmP = pcount(~scale(date) + scale(reedcover) ~ scale(log(water)) + scale(latitude), 
      data = umf, K = 80)
residqq(fmP, "site-sum")
residqq(fmP, "observation")



