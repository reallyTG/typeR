library(rworldmap)


### Name: country2Region
### Title: Produce regional data from country level data
### Aliases: country2Region
### Keywords: manip

### ** Examples


data(countryExData)

#to report which countries make up regions
country2Region(regionType="Stern")

#Using country2Region to calculate mean Environmental Health index in Stern regions.
sternEnvHealth <- country2Region(inFile=countryExData
		,nameDataColumn="ENVHEALTH"
		,joinCode="ISO3"
		,nameJoinColumn="ISO3V10"
		,regionType="Stern"
		,FUN='mean'
		)

print(sternEnvHealth)

#A simple plot of this data.
#dotchart(sort(sternEnvHealth))
dotchart(sort(sternEnvHealth[,1]))

#use FUN='identity' to see which countries in your data belong to which region.
country2Region(inFile=countryExData
		,nameDataColumn="Country"
		,joinCode="ISO3"
		,nameJoinColumn="ISO3V10"
		,regionType="Stern"
		,FUN='identity'
		)

#Change FUN to length, to count the number of countries in each region.
country2Region(inFile=countryExData
		,nameDataColumn="Country"
		,joinCode="ISO3"
		,nameJoinColumn="ISO3V10"
		,regionType="Stern"
		,FUN='length'
		)






