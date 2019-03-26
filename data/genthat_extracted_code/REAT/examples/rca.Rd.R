library(REAT)


### Name: rca
### Title: Analysis of regional beta and sigma convergence
### Aliases: rca

### ** Examples

data (G.counties.gdp)
# Loading GDP data for Germany (counties = Landkreise)

rca (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = NULL, beta.plot = TRUE)
# Two years, no conditions (Absolute beta convergence)


regionaldummies <- to.dummy(G.counties.gdp$regional)
# Creating dummy variables for West/East
G.counties.gdp$West <- regionaldummies[,2]
G.counties.gdp$East <- regionaldummies[,1]
# Adding dummy variables to data

rca (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = G.counties.gdp[c(70,71)])
# Two years, with conditions
# (Absolute and conditional beta convergence)

converg1 <- rca (G.counties.gdp$gdppc2010, 2010, G.counties.gdp$gdppc2011, 2011, 
conditions = G.counties.gdp[c(70,71)])
# Store results in object
converg1$betaconv$abeta
# Addressing estimates for the conditional beta model


rca (G.counties.gdp$gdppc2010, 2010, G.counties.gdp[65:68], 2014, conditions = NULL, 
sigma.type = "trend", beta.plot = TRUE, sigma.plot = TRUE)
# Five years, no conditions (Absolute beta convergence)
# with plots for both beta and sigma convergence



