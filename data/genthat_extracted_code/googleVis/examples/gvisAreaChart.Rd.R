library(googleVis)


### Name: gvisAreaChart
### Title: Google Area Chart with R
### Aliases: gvisAreaChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Area chart
Area1 <- gvisAreaChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Area1)

## Stacked chart
Area2 <- gvisAreaChart(df, xvar="country", yvar=c("val1", "val2"),
      options=list(isStacked=TRUE))
plot(Area2)


## Add a customised title
Area3 <- gvisAreaChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}"))
plot(Area3)

## Not run: 
##D ## Change y-axis to percentages
##D Area3 <- gvisAreaChart(df, xvar="country", yvar=c("val1", "val2"),
##D                        options=list(vAxis="{format:'#,###%'}"))
##D plot(Area3)
## End(Not run)




