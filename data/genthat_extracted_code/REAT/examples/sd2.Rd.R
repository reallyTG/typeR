library(REAT)


### Name: sd2
### Title: Standard deviation (extended)
### Aliases: sd2

### ** Examples

# Regional disparities / sigma convergence in Germany
data(G.counties.gdp)
# GDP per capita for German counties (Landkreise)
sd_gdppc <- apply (G.counties.gdp[54:68], MARGIN = 2, FUN = sd2)
# Calculating standard deviation for the years 2000-2014
years <- 2000:2014
# vector of years (2000-2014)
plot(years, sd_gdppc, "l", ylim = c(0,15000), xlab = "Year", 
ylab = "SD of GDP per capita")
# Plot sd over time



