library(MPDiR)


### Name: psyfun.boot
### Title: Bootstrapping Standard Errors of Psychometric Function
###   Parameters
### Aliases: psyfun.boot
### Keywords: models nonparametric

### ** Examples

data(HSP)
SHR2 <- subset(HSP, Obs == "SH" & Run == "R2")
SHR2 <- within(SHR2, {
	nyes <- N * p/100
	nno <- N - nyes
	})
SHR2.glm <- glm(cbind(nyes, nno) ~ log(Q), binomial, SHR2)
### For a real problem, set N to 10000 or so
SHR2.boot <- psyfun.boot(SHR2.glm, 10)



