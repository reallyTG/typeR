library(RWiener)


### Name: wdm
### Title: Wiener diffusion model fit function
### Aliases: wdm print.wdm vcov.wdm confint.wdm summary.wdm
###   print.summary.wdm
### Keywords: wdm

### ** Examples

## generate random data
dat <- rbind(cbind(rwiener(100, 2,.3,.5,1), group="A"),
        cbind(rwiener(100,2,.3,.5,-1), group="B"))

## fit wdm
wdm1 <- wdm(dat)

## extract parameters
coef(wdm1)

## further models
wdm2 <- wdm(dat, beta=.5)
wdm3 <- wdm(dat, alpha=wdm1$coefficients[1], tau=wdm1$coefficients[2],
            beta=wdm1$coefficients[3], xvar="group")



