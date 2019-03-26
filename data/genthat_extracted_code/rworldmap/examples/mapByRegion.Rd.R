library(rworldmap)


### Name: mapByRegion
### Title: Produce maps of regional level data from country level data
### Aliases: mapByRegion
### Keywords: hplot

### ** Examples


data(countryExData)

mapByRegion(inFile=countryExData
		        ,nameDataColumn="CLIMATE"
		        ,joinCode="ISO3"
		        ,nameJoinColumn="ISO3V10"
		        ,regionType="Stern"
	         	,FUN='mean'
	         	)





