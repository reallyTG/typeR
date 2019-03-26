library(ivregEX)


### Name: plot.sensIvregEX
### Title: Plotting of Sensitivity Analyses
### Aliases: plot.sensIvregEX
### Keywords: Plotting Sensitivity Analysis Sensitivity Interval

### ** Examples


data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)


fm2 <- ivreg.EX(log(packs) ~ log(rprice) + log(rincome) | tdiff + log(rincome), 
			data = CigarettesSW, subset = year == "1995")
lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, subset = year == "1995")
res = coeftestIV(fm2, lmfit, 'log(rprice)')

z <- sensIvreg(fm2, res, 'log(rprice)', effect = c(-.1, 0, .1, .15, .17), show = FALSE)

plot(z, nc = 3)




