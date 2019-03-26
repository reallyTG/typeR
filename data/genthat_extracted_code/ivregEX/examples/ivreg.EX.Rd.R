library(ivregEX)


### Name: ivreg.EX
### Title: Constructing independent evidence (EX estimates) in an IV
###   regression
### Aliases: ivreg.EX
### Keywords: regression IV Model

### ** Examples


data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

fm2 <- ivreg.EX(log(packs) ~ log(rprice) + log(rincome) | tdiff + log(rincome), 
		data = CigarettesSW, subset = year == "1995")
lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, subset = year == "1995")

coeftestIV(fm2, lmfit, 'log(rprice)')




