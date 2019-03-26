library(googleVis)


### Name: gvisPieChart
### Title: Google Pie Chart with R
### Aliases: gvisPieChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

Pie1 <- gvisPieChart(CityPopularity)
plot(Pie1)

## Doughnut chart - a pie with a hole
Pie2 <- gvisPieChart(CityPopularity, options=list(
                    slices="{4: {offset: 0.2}, 0: {offset: 0.3}}",
                    title='City popularity',
                    legend='none',
                    pieSliceText='label',
                    pieHole=0.5))
plot(Pie2)






