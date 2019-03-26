library(RWiener)


### Name: tests
### Title: Wiener Diffusion model test functions
### Aliases: anova.wdm waldtest waldtest.wdm print.wwaldt
### Keywords: anova.wdm

### ** Examples

# a random dataset
dat <- rbind(cbind(rwiener(100, 2,.3,.5,0), grp="A"),
cbind(rwiener(100,2,.3,.5,1), grp="B"))

# create nested wdm model objects (from specific to general)
wdm1 <- wdm(dat)
wdm2 <- wdm(dat,
            alpha=coef(wdm1)[1], tau=coef(wdm1)[2], beta=coef(wdm1)[3],
            xvar="grp")
wdm3 <- wdm(dat,
            tau=coef(wdm1)[2],
            xvar="grp")

# conduct LRT tests
anova1 <- anova(wdm1,wdm2,wdm3)
anova1

# waldtest
wt1 <- waldtest(wdm1, theta="delta", theta0=0)
wt1



