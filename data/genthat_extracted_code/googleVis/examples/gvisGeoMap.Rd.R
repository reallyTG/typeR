library(googleVis)


### Name: gvisGeoMap
### Title: Google Geo Map with R
### Aliases: gvisGeoMap
### Keywords: iplot

### ** Examples

## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

## Regions Example
## The regions style fills entire regions (typically countries) with colors
## corresponding to the values that you assign. Specify the regions style
## by assigning options['dataMode'] = 'regions' in your code.

G1 <- gvisGeoMap(Exports, locationvar='Country', numvar='Profit',
                 options=list(dataMode="regions")) 

plot(G1)

## Markers Example
## The "markers" style displays a circle, sized and colored to indicate
## a value, over the regions that you specify. 
G2 <- gvisGeoMap(CityPopularity, locationvar='City', numvar='Popularity',
                 options=list(region='US', height=350, 
                              dataMode='markers',
                              colors='[0xFF8747, 0xFFB581, 0xc06000]'))  

plot(G2) 

## Example showing US data by state 

require(datasets)
states <- data.frame(state.name, state.x77)

G3 <- gvisGeoMap(states, "state.name", "Illiteracy",
                 options=list(region="US", dataMode="regions",
                              width=600, height=400))
plot(G3) 

## Example with latitude and longitude information
## Show Hurricane Andrew (1992) storm track
G4 <- gvisGeoMap(Andrew, locationvar="LatLong", numvar="Speed_kt", 
                 hovervar="Category", 
                 options=list(height=350, region="US", dataMode="markers"))

plot(G4) 

## World population
WorldPopulation=data.frame(Country=Population$Country, 
                           Population.in.millions=round(Population$Population/1e6,0),
                           Rank=paste(Population$Country, "Rank:", Population$Rank))

G5 <- gvisGeoMap(WorldPopulation, "Country", "Population.in.millions", "Rank", 
                 options=list(dataMode="regions", width=600, height=300))
plot(G5)




