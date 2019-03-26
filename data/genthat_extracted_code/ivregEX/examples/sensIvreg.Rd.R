library(ivregEX)


### Name: sensIvreg
### Title: Sensitivity analysis in instrumental variables regression model
### Aliases: sensIvreg sensIvreg.ivregEX sensIvreg.ivreg
### Keywords: Sensitivity Analysis Sensitivity Interval IV Model

### ** Examples

data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)


######################
library(AER)

fm1 <- ivreg(log(packs) ~ log(rprice) + log(rincome) | tdiff + log(rincome),
		data = CigarettesSW, subset = year == "1995", x=TRUE)

z <- sensIvreg(fm1, variable = 'log(rprice)')


######################

fm2 <- ivreg.EX(log(packs) ~ log(rprice) + log(rincome) | tdiff + log(rincome), 
		data = CigarettesSW, subset = year == "1995")
lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, 
		subset = year == "1995")
res = coeftestIV(fm2, lmfit, 'log(rprice)')

z <- sensIvreg(fm2, res, 'log(rprice)', effect = c(-.1, 0, .1, .15, .17))

###################

x = CigarettesSW[CigarettesSW[,'year'] == "1995", c('rprice', 'rincome')]
y = CigarettesSW[CigarettesSW[,'year'] == "1995", c('packs')]
z = CigarettesSW[CigarettesSW[,'year'] == "1995", c('tdiff', 'rincome')]

fm3 <- ivreg.fit.EX(as.matrix(x), y, z)
lmfit <- lm(packs ~ rprice + rincome, data = CigarettesSW, subset = year == "1995")
res = coeftestIV(fm3, lmfit, 'rprice')
z <- sensIvreg(fm3, res, 'rprice', effect = c(-.1, 0, .1, .15, .17))

##################




