library(bdpv)


### Name: CInpvppv
### Title: Asymptotic confidence intervals for negative and positive
###   predictive values.
### Aliases: CInpvppv CIlnpv CIlppv CIlnpvak CIlppvak CombCInpv CombCIppv
### Keywords: htest

### ** Examples

CIlnpv(x0=c(87,288), x1=c(240,178), p=0.03,
 conf.level = 0.95, alternative = "two.sided")

CIlppv(x0=c(87,288), x1=c(240,178), p=0.03,
 conf.level = 0.95, alternative = "two.sided")

CIlnpvak(x0=c(87,288), x1=c(240,178), p=0.03,
 conf.level = 0.95, alternative = "two.sided")

CIlppvak(x0=c(87,288), x1=c(240,178), p=0.03,
 conf.level = 0.95, alternative = "two.sided")




