library(ivregEX)


### Name: plot.si
### Title: Plot Insensitive Region
### Aliases: plot.si
### Keywords: Plotting Sensitivity Interval

### ** Examples


data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

library(AER)


lmfit <- lm(log(packs) ~ log(rprice) + log(rincome), data = CigarettesSW, subset = year == "1995")

z <- senslm(lmfit, variable = 'log(rprice)')
plot(z)




