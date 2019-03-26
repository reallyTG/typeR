library(sensR)


### Name: profile.discrim
### Title: Profile likelihood and confidence interval methods for discrim
###   objects
### Aliases: profile.discrim plot.profile.discrim confint.discrim
### Keywords: models

### ** Examples

## 7 success out of 10 samples in a duo-trio experiment:
(dd <- discrim(7, 10, method = "duotrio", statistic = "likelihood"))
confint(dd)
plot(profile(dd))
points(confint(dd)[3,], rep(.1465, 2), pch = 3, cex = 2, lwd=2)




