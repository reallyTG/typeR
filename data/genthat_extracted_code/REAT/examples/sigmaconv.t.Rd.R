library(REAT)


### Name: sigmaconv.t
### Title: Analysis of regional sigma convergence for a time series using
###   trend regression
### Aliases: sigmaconv.t

### ** Examples

data(G.counties.gdp)
# Loading GDP data for Germany (counties = Landkreise)

# Sigma convergence 2010-2014:
sigmaconv.t (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:68], 2014, 
sigma.plot = TRUE, print.results = TRUE)
# Using the standard deviation with logged GDP per capita

sigmaconv.t (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:68], 2014, 
sigma.measure = "cv", sigma.log = FALSE, print.results = TRUE)
# Using the coefficient of variation (GDP per capita not logged)



