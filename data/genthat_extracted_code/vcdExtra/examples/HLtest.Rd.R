library(vcdExtra)


### Name: HLtest
### Title: Hosmer-Lemeshow Goodness of Fit Test
### Aliases: HosmerLemeshow HLtest plot.HLtest print.HLtest
###   rootogram.HLtest summary.HLtest
### Keywords: htest

### ** Examples


data(birthwt, package="MASS")
# how to do this without attach?
attach(birthwt)
	race = factor(race, labels = c("white", "black", "other"))
	ptd = factor(ptl > 0)
	ftv = factor(ftv)
	levels(ftv)[-(1:2)] = "2+"
	bwt <- data.frame(low = factor(low), age, lwt, race,
    	smoke = (smoke > 0), ptd, ht = (ht > 0), ui = (ui > 0), ftv)
detach(birthwt)
options(contrasts = c("contr.treatment", "contr.poly"))
BWmod <- glm(low ~ ., family=binomial, data=bwt)

(hlt <- HLtest(BWmod))
str(hlt)
summary(hlt)
plot(hlt)

# basic model
BWmod0 <- glm(low ~ age, family=binomial, data=bwt)
(hlt0 <- HLtest(BWmod0))
str(hlt0)
summary(hlt0)
plot(hlt0)





