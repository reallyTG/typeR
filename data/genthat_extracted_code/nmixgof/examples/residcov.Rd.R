library(nmixgof)


### Name: residcov
### Title: Plot residuals against covariates
### Aliases: residcov

### ** Examples

library(unmarked)
umf = unmarkedFramePCount(y = shoveler$y, obsCovs = shoveler$obs, siteCovs = shoveler$site)
fmP = pcount(~scale(date) + scale(reedcover) ~ scale(log(water)) + scale(latitude), 
      data = umf, K = 80)
residcov(fmP)



