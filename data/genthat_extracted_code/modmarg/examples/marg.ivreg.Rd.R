library(modmarg)


### Name: marg.ivreg
### Title: Predicted Margins for 'ivreg' objects from the 'AER' package
### Aliases: marg.ivreg

### ** Examples

# From ?AER::ivreg

# data
data("CigarettesSW", package = "AER")
CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)

# model
fm <- AER::ivreg(log(packs) ~ log(rprice) + log(rincome) |
                   log(rincome) + tdiff + I(tax/cpi),
                 data = CigarettesSW, subset = year == "1995")

# Get margins for different levels of price/cpi
rprice_levs <- round(quantile(CigarettesSW$rprice))

marg(fm, data = subset(CigarettesSW, year == "1995"),
     var_interest = 'rprice', at_var_interest = rprice_levs)




