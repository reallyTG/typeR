library(nmixgof)


### Name: residfit
### Title: Plot residuals against fitted values
### Aliases: residfit

### ** Examples

library(unmarked)
umf = unmarkedFramePCount(y = shoveler$y, obsCovs = shoveler$obs, siteCovs = shoveler$site)
fmP = pcount(~scale(date) + scale(reedcover) ~ scale(log(water)) + scale(latitude), 
      data = umf, K = 80)
residfit(fmP, "marginal")
residfit(fmP, "site-sum")
residfit(fmP, "observation")



