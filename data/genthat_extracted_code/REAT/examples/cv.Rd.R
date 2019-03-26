library(REAT)


### Name: cv
### Title: Coefficient of variation
### Aliases: cv

### ** Examples

# Regional disparities / sigma convergence in Germany
data(G.counties.gdp)
# GDP per capita for German counties (Landkreise)
cvs <- apply (G.counties.gdp[54:68], MARGIN = 2, FUN = cv)
# Calculating cv for the years 2000-2014
years <- 2000:2014
plot(years, cvs, "l", ylim=c(0.3,0.6), xlab = "year", 
ylab = "CV of GDP per capita")
# Plot cv over time



