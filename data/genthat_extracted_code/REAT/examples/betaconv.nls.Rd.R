library(REAT)


### Name: betaconv.nls
### Title: Analysis of regional beta convergence using nonlinear regression
### Aliases: betaconv.nls

### ** Examples

data (G.counties.gdp)
# Loading GDP data for Germany (counties = Landkreise)
betaconv.nls (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = NULL, print.results = TRUE)
# Two years, no conditions (Absolute beta convergence)



