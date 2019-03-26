library(extRemes)


### Name: Peak
### Title: Salt River Peak Stream Flow
### Aliases: Peak
### Keywords: datasets

### ** Examples

data(Peak)
str(Peak)
# Fig. 9 of Katz et al. (2002) Sec. 5.2.2.
plot(Peak[,"Year"], Peak[,"Flow"]/1000, type="l", yaxt="n",
    xlab="Water year (Oct-Sept)", ylab="Annual peak flow (thousand cfs)")
axis(2,at=c(0,40,80,120),labels=c("0","40","80","120"))



