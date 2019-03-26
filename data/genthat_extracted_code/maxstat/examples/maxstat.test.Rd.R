library(maxstat)


### Name: maxstat.test
### Title: Maximally Selected Rank and Statistics
### Aliases: maxstat.test maxstat.test.data.frame maxstat.test.default
###   maxstat
### Keywords: htest

### ** Examples


set.seed(29)

x <- sort(runif(20))
y <- c(rnorm(10), rnorm(10, 2))
mydata <- data.frame(cbind(x,y))

mod <- maxstat.test(y ~ x, data=mydata, smethod="Wilcoxon", pmethod="HL",
                    minprop=0.25, maxprop=0.75, alpha=0.05)
print(mod)
plot(mod)

# adjusted for more than one prognostic factor.
library("survival")
mstat <- maxstat.test(Surv(time, cens) ~ IPI + MGE, data=DLBCL, 
                      smethod="LogRank", pmethod="exactGauss", 
                      abseps=0.01)
plot(mstat)

### sphase
set.seed(29)
data("sphase", package = "TH.data")

maxstat.test(Surv(RFS, event) ~ SPF, data=sphase, smethod="LogRank",
             pmethod="Lau94")

maxstat.test(Surv(RFS, event) ~ SPF, data=sphase, smethod="LogRank",
             pmethod="Lau94", iscores=TRUE)

maxstat.test(Surv(RFS, event) ~ SPF, data=sphase, smethod="LogRank",
             pmethod="HL")

maxstat.test(Surv(RFS, event) ~ SPF, data=sphase, smethod="LogRank",
             pmethod="condMC", B = 9999)

plot(maxstat.test(Surv(RFS, event) ~ SPF, data=sphase, smethod="LogRank"))





