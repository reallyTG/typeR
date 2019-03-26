library(googleVis)


### Name: gvisMerge
### Title: Merge two googleVis charts into one gvis-object
### Aliases: gvisMerge
### Keywords: aplot

### ** Examples

## Please note that by default the googleVis plot command
## will open a browser window and requires Internet
## connection to display the visualisation.

Pie1 <- gvisPieChart(CityPopularity)

## Doughnut chart - a pie with a hole
Pie2 <- gvisPieChart(CityPopularity, options=list(
  slices="{4: {offset: 0.2}, 0: {offset: 0.3}}",
  title='City popularity',
  legend='none',
  pieSliceText='label',
  pieHole=0.5))

plot(gvisMerge(Pie2, Pie1, 
        tableOptions = "cellspacing=\"20\" bgcolor=\"#AABBCC\"",
        horizontal=TRUE))
               
## Nested charts               
               
G <- gvisGeoChart(Exports, "Country", "Profit", 
                  options=list(width=250, height=100))
T <- gvisTable(Exports, 
                  options=list(width=250, height=300))

GT <- gvisMerge(G,T, horizontal=FALSE) 
plot(GT)

M <- gvisMotionChart(Fruits, "Fruit", "Year",
                     options=list(width=400, height=410))

GTM <- gvisMerge(GT, M, horizontal=TRUE,
                     tableOptions="cellspacing=10")
plot(GTM)


line <- gvisLineChart(OpenClose, "Weekday", c("Open", "Close"), 
        options=list(legend='none', width=300, height=150))
column <- gvisColumnChart(OpenClose, "Weekday", c("Open", "Close"),
              options=list(legend='none', width=300, height=150))
area <- gvisAreaChart(OpenClose, "Weekday", c("Open", "Close"),
              options=list(legend='none', width=300, height=150))
bar <- gvisBarChart(OpenClose, "Weekday", c("Open", "Close"),
              options=list(legend='none', width=300, height=150))
LBCA <- gvisMerge(gvisMerge(line, bar), gvisMerge(column, area),
                  horizontal=TRUE, tableOptions="bgcolor=\"#AABBCC\"") 

plot(LBCA)

## Applying gvisMerge successively

p <- Reduce(gvisMerge, list(line, column, area, bar))
plot(p)               




