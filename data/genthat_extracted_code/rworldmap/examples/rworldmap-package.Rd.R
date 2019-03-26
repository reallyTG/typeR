library(rworldmap)


### Name: rworldmap-package
### Title: For mapping global data.
### Aliases: rworldmap rworldmap-package
### Keywords: package

### ** Examples



#mapping country level data, with no file specified it uses internal example data
mapCountryData()
#specifying region
mapCountryData(mapRegion="asia")
#mapping gridded data, with no file specified it uses internal example data
mapGriddedData()
#specifying region 
mapGriddedData(mapRegion="africa")  
#aggregating gridded data to country level 
#with no file specified it uses internal example data
mapHalfDegreeGridToCountries()              






