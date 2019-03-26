library(REAT)


### Name: betaconv.ols
### Title: Analysis of regional beta convergence using OLS regression
### Aliases: betaconv.ols

### ** Examples

data (G.counties.gdp)

betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = NULL, print.results = TRUE)
# Two years, no conditions (Absolute beta convergence)

regionaldummies <- to.dummy(G.counties.gdp$regional)
# Creating dummy variables for West/East
G.counties.gdp$West <- regionaldummies[,2]
G.counties.gdp$East <- regionaldummies[,1]
# Adding dummy variables to data

betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = G.counties.gdp[c(70,71)], print.results = TRUE)
# Two years, with condition (dummy for West/East)
# (Absolute and conditional beta convergence)

betaconverg1 <- betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011,
conditions = G.counties.gdp[c(70,71)], print.results = TRUE)
# Store results in object
betaconverg1$cbeta$estimates
# Addressing estimates for the conditional beta model


betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:66], 2012, 
conditions = NULL, print.results = TRUE)
# Three years (2010-2012), no conditions (Absolute beta convergence)

betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:66], 2012, 
conditions = G.counties.gdp[c(70,71)], print.results = TRUE)
# Three years (2010-2012), with conditions (Absolute and conditional beta convergence)

betaconverg2 <- betaconv.ols (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:66],
2012, conditions = G.counties.gdp[c(70,71)], print.results = TRUE)
# Store results in object
betaconverg2$cbeta$estimates
# Addressing estimates for the conditional beta model



