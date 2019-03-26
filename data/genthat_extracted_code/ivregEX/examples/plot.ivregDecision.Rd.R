library(ivregEX)


### Name: plot.ivregDecision
### Title: Plotting an object of class 'ivregDecision' or
###   'ivregDecisionList'
### Aliases: plot.ivregDecision plot.ivregDecisionList
### Keywords: Plotting Sensitivity Analysis

### ** Examples

data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)


fm2 <- ivreg.EX(log(packs) ~ log(rprice) + log(rincome) | tdiff + log(rincome), 
		data = CigarettesSW, subset = year == "1995")
lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, 
		subset = year == "1995")
res = coeftestIV(fm2, lmfit, 'log(rprice)')

z <- sensIvreg(fm2, res, 'log(rprice)', delta1 = seq(-.51, .51, .01), 
		effect = c(-.1, 0, .1, .15, .17))

plot(z$Z[[1]])
plot(z$Z, nc = 3)



