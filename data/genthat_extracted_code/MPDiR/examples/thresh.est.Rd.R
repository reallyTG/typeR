library(MPDiR)


### Name: thresh.est
### Title: Estimate Threshold Level from Model Object
### Aliases: thresh.est
### Keywords: univar models

### ** Examples

data(HSP)
SHR1.glm <- glm(p/100 ~ log(Q), binomial(probit), HSP,
	subset = Obs == "SH" & Run == "R1")
thresh.est(1:3/4, SHR1.glm)



