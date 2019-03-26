library(ivregEX)


### Name: coeftestIV
### Title: Coefficient test of output of ivreg.EX.
### Aliases: coeftestIV
### Keywords: htest sandwich method

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

##############
x = CigarettesSW[CigarettesSW[,'year'] == "1995", c('rprice', 'rincome')]
y = CigarettesSW[CigarettesSW[,'year'] == "1995", c('packs')]
z = CigarettesSW[CigarettesSW[,'year'] == "1995", c('tdiff', 'rincome')]

fm3 <- ivreg.fit.EX(as.matrix(x), y, z)
lmfit <- lm(packs ~ rprice + rincome, data = CigarettesSW, subset = year == "1995")
res = coeftestIV(fm3, lmfit, 'rprice')
res




