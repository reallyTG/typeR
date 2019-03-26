library(Zelig)


### Name: Zelig-ivreg-class
### Title: Instrumental-Variable Regression
### Aliases: Zelig-ivreg-class zivreg

### ** Examples

library(Zelig)
library(dplyr) # for the pipe operator %>%
# load and transform data
data("CigarettesSW")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)
# log second stage independent variables, as logging internally for ivreg is
# not currently supported
CigarettesSW$log_rprice <- log(CigarettesSW$rprice)
CigarettesSW$log_rincome <- log(CigarettesSW$rincome)
z.out1 <- zelig(log(packs) ~ log_rprice + log_rincome |
log_rincome + tdiff + I(tax/cpi),data = CigarettesSW, subset = year == "1995",model = "ivreg")
summary(z.out1)
library(Zelig)
library(AER) # for sandwich vcov
library(dplyr) # for the pipe operator %>%

# load and transform data
data("CigarettesSW")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

# log second stage independent variables, as logging internally for ivreg is
# not currently supported
CigarettesSW$log_rprice <- log(CigarettesSW$rprice)
CigarettesSW$log_rincome <- log(CigarettesSW$rincome)

# estimate model
z.out1 <- zelig(log(packs) ~ log_rprice + log_rincome |
                    log_rincome + tdiff + I(tax/cpi),
                    data = CigarettesSW,
                    model = "ivreg")
summary(z.out1)




