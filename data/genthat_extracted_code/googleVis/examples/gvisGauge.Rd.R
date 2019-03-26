library(googleVis)


### Name: gvisGauge
### Title: Google Gauge with R
### Aliases: gvisGauge
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

Gauge1 <- gvisGauge(CityPopularity, options=list(min=0, max=800, greenFrom=500,
                    greenTo=800, yellowFrom=300, yellowTo=500,
                    redFrom=0, redTo=300))

plot(Gauge1)




