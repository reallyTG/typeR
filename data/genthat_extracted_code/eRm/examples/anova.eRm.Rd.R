library(eRm)


### Name: Analysis of Deviances
### Title: Analysis of Deviances for Rasch Models
### Aliases: anova.eRm print.eRm_anova

### ** Examples

### dichotomous data
dmod1 <- RM(lltmdat1)
dmod2 <- LLTM(lltmdat1, mpoints = 2)
anova(dmod1, dmod2)

### polytomous data
pmod1 <- RSM(rsmdat)
pmod2 <- PCM(rsmdat)
anova(pmod1, pmod2)

W <- cbind(rep(c(1,0), each=9), rep(c(0,1), each=9))
W
pmod3 <- LPCM(rsmdat, W)
anova(pmod3, pmod1, pmod2) # note that models are sorted by npar



