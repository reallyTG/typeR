library(REAT)


### Name: sigmaconv
### Title: Analysis of regional sigma convergence for two years using ANOVA
### Aliases: sigmaconv

### ** Examples

data(G.counties.gdp)
# Loading GDP data for Germany (counties = Landkreise)

sigmaconv (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
sigma.measure = "cv", print.results =  TRUE)
# Using the coefficient of variation

sigmaconv (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
sigma.log = TRUE, print.results =  TRUE)
# Using the standard deviation with logged GDP per capita



