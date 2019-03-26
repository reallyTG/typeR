library(ivregEX)


### Name: senslm
### Title: Sensitivity analysis of a least squared regression estimator
### Aliases: senslm
### Keywords: regression Sensitivity Analysis Sensitivity Interval

### ** Examples

	
data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, subset = year == "1995")

z <- senslm(lmfit, variable = 'log(rprice)')




