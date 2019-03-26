library(UScancer)


### Name: UScancer-package
### Title: Create US cancer datasets from SEER, IARC, and US Census data
### Aliases: UScancer-package UScancer
### Keywords: package

### ** Examples


data(fipslookup)
data(dplookup)

## Not run: 
##D 
##D censusData <- readCensus(state="Kentucky",fips=fipslookup,codes=dplookup)
##D seerData <- readSEER(year=2005,state="Kentucky",cancer="Larynx",fips=fipslookup)
##D 
##D library(diseasemapping)
##D larynxRates <- cancerRates("USA", year=1998:2002,site="Larynx")
##D kentucky <- getSMR(censusData,larynxRates,seerData,regoinCode="County")
##D 
##D breaks = c(0,1,seq(2, ceiling(max(kentucky$SMR)),by=2))
##D thecol = terrain.colors(length(breaks)-1)
##D plot(kentucky, col = thecol[cut(kentucky$SMR, breaks,include.lowest=TRUE)] )
## End(Not run)





