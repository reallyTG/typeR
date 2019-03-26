library(REAT)


### Name: var2
### Title: Variance (extended)
### Aliases: var2

### ** Examples

# Regional disparities / sigma convergence in Germany
data(G.counties.gdp)
# GDP per capita for German counties (Landkreise)
vars <- apply (G.counties.gdp[54:68], MARGIN = 2, FUN = var2)
# Calculating variance for the years 2000-2014
years <- 2000:2014
plot(years, vars, "l", xlab = "year", 
ylab = "Variance of GDP per capita")
# Plot variance over time



