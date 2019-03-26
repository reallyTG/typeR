library(REAT)


### Name: portfolio
### Title: Portfolio matrix
### Aliases: portfolio

### ** Examples

data(Freiburg)
# Loads employment data for Freiburg and Germany (2008 and 2014)

portfolio(Freiburg$e_Freiburg2008, Freiburg$e_Freiburg2014, 
Freiburg$e_Germany2008, Freiburg$e_Germany2014, 
industry.names = Freiburg$industry, Freiburg$e_Freiburg2014, psize.factor = 12,
pmx = "Freiburg", pmy = "Deutschland", pmtitle = "Freiburg und BRD", 
pcol = Freiburg$color, leg = TRUE, leg.fsize = 0.6, bgrid = TRUE, leg.y = -0.17)



