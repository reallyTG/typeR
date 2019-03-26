library(googleVis)


### Name: gvisLineChart
### Title: Google Line Chart with R
### Aliases: gvisLineChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

df <- data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Line chart
Line1 <- gvisLineChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Line1)


## Add a customised title and smoothed curve
Line2 <- gvisLineChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}",
                          curveType='function'))
plot(Line2)

## Not run: 
##D ## Change y-axis to percentages
##D Line3 <- gvisLineChart(df, xvar="country", yvar=c("val1", "val2"),
##D                        options=list(vAxis="{format:'#,###%'}"))
##D plot(Line3)
##D 
## End(Not run)

## Create a chart with two y-axis:
Line4 <-  gvisLineChart(df, "country", c("val1","val2"),
                        options=list(series="[{targetAxisIndex: 0},
                                              {targetAxisIndex:1}]",
                          vAxes="[{title:'val1'}, {title:'val2'}]"
                          ))
plot(Line4)

## Line chart with edit button
Line5 <- gvisLineChart(df, xvar="country", yvar=c("val1", "val2"),
                       options=list(gvis.editor="Edit me!"))
plot(Line5)

## Customizing lines 
Dashed <-  gvisLineChart(df, xvar="country", yvar=c("val1","val2"),
             options=list(
             series="[{color:'green', targetAxisIndex: 0, 
                       lineWidth: 1, lineDashStyle: [2, 2, 20, 2, 20, 2]}, 
                      {color: 'blue',targetAxisIndex: 1, 
                       lineWidth: 2, lineDashStyle: [4, 1]}]",
                       vAxes="[{title:'val1'}, {title:'val2'}]"
                       ))
plot(Dashed)




