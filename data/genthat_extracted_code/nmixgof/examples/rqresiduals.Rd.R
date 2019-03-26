library(nmixgof)


### Name: rqresiduals
### Title: Randomized quantile resiudals for binomial N-mixture models.
### Aliases: rqresiduals

### ** Examples

library(unmarked)
umf = unmarkedFramePCount(y = shoveler$y, obsCovs = shoveler$obs, siteCovs = shoveler$site)
fmP = pcount(~scale(date) + scale(reedcover) ~ scale(log(water)) + scale(latitude), 
      data = umf, K = 80)
qqnorm(rqresiduals(fmP, "s"))
qqnorm(rqresiduals(fmP, "o"))
par(mfcol = c(3,4))
invisible(apply(rqresiduals(fmP, "m"), 2, qqnorm))



