library(googleVis)


### Name: gvisGeoChart
### Title: Google Geo Chart with R
### Aliases: gvisGeoChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

## Regions examples
## The regions style fills entire regions (typically countries) with
## colors corresponding to the values that you assign

G1a <- gvisGeoChart(Exports, locationvar='Country', colorvar='Profit') 

plot(G1a)

## Change projection
G1b <- gvisGeoChart(Exports, locationvar='Country', colorvar='Profit',
                   options=list(projection="kavrayskiy-vii")) 

plot(G1b)

## Plot only Europe
G2 <- gvisGeoChart(Exports, "Country", "Profit",
                   options=list(region="150"))

plot(G2)


## Example showing US data by state 
require(datasets)

states <- data.frame(state.name, state.x77)
G3 <- gvisGeoChart(states, "state.name", "Illiteracy",
                 options=list(region="US", displayMode="regions", 
                              resolution="provinces",
   	 width=600, height=400))
plot(G3)

## Markers Example
## A marker style map renders bubble-shaped markers at specified
## locations with the color and size that you specify.

G4 <- gvisGeoChart(CityPopularity, locationvar='City', colorvar='Popularity',
                      options=list(region='US', height=350, 
                                   displayMode='markers',
				   colorAxis="{values:[200,400,600,800],
                                   colors:[\'red', \'pink\', \'orange',\'green']}")
                      ) 
plot(G4)

G5 <- gvisGeoChart(Andrew, "LatLong", colorvar='Speed_kt',
                   options=list(region="US"))
plot(G5)


G6 <- gvisGeoChart(Andrew, "LatLong", sizevar='Speed_kt',
                   colorvar="Pressure_mb", options=list(region="US"))
plot(G6)

## Create lat:long values and plot a map of Oceania
## Set background colour to light-blue

require(stats)
data(quakes)
head(quakes)
quakes$latlong<-paste(quakes$lat, quakes$long, sep=":")

G7 <- gvisGeoChart(quakes, "latlong", "depth", "mag",
                   options=list(displayMode="Markers", region="009",
                   colorAxis="{colors:['red', 'grey']}",
                   backgroundColor="lightblue"))

plot(G7)

## Not run: 
##D # Plot S&P countries' credit rating sourced from Wikipedia
##D # Use the hovervar to show the rating
##D library(XML)
##D url <- "http://en.wikipedia.org/wiki/List_of_countries_by_credit_rating"
##D x <- readHTMLTable(readLines(url), which=3)
##D levels(x$Rating) <- substring(levels(x$Rating), 4, 
##D                               nchar(levels(x$Rating)))
##D x$Ranking <- x$Rating
##D levels(x$Ranking) <- nlevels(x$Rating):1
##D x$Ranking <- as.character(x$Ranking)
##D x$Rating <- paste(x$Country, x$Rating, sep=": ")
##D #### Create a geo chart
##D G8 <- gvisGeoChart(x, "Country", "Ranking", hovervar="Rating",
##D                 options=list(gvis.editor="S&P", 
##D                              colorAxis="{colors:['#91BFDB', '#FC8D59']}"))
##D plot(G8)
##D 
##D 
##D ## Plot world wide earth quakes of the last 30 days with magnitude >= 4.0 
##D library(XML)
##D ## Get earthquake data of the last 30 days
##D eq <- read.csv("http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/2.5_week.csv")
##D eq$loc=paste(eq$Latitude, eq$Longitude, sep=":")
##D 
##D G9 <- gvisGeoChart(eq, "loc", "Depth", "Magnitude",
##D                    options=list(displayMode="Markers", 
##D                    colorAxis="{colors:['purple', 'red', 'orange', 'grey']}",
##D                    backgroundColor="lightblue"), chartid="EQ")
##D plot(G9)
## End(Not run)




