library(googleVis)


### Name: gvisComboChart
### Title: Google Combo Chart with R
### Aliases: gvisComboChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

CityPopularity
## Add the mean
CityPopularity$Mean=mean(CityPopularity$Popularity)

C1 <- gvisComboChart(CityPopularity, xvar="City",
                                     yvar=c("Mean", "Popularity"),
                                   options=list(seriesType="bars",
                                                title="City Popularity",
                                                series='{0: {type:"line"}}'))
plot(C1)

## Changing the width of columsn
C2 <- gvisComboChart(CityPopularity, xvar="City",
                                     yvar=c("Mean", "Popularity"),
                                   options=list(seriesType="bars",
                                                bar="{groupWidth:'100%'}",
                                                title="City Popularity",
                                                series='{0: {type:"line"}}'))
plot(C2)





