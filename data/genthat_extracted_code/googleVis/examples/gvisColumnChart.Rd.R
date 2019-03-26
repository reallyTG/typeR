library(googleVis)


### Name: gvisColumnChart
### Title: Google Column Chart with R
### Aliases: gvisColumnChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Column chart
Col1 <- gvisColumnChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Col1)

## Stacked column chart
Col2 <- gvisColumnChart(df, xvar="country", yvar=c("val1", "val2"),
     options=list(isStacked=TRUE))
plot(Col2)


## Add a customised title and and change width of columns
Col3 <- gvisColumnChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}",
                          bar="{groupWidth:'100%'}"))
plot(Col3)

## Not run: 
##D ## Change y-axis to percentages
##D Col4 <- gvisColumnChart(df, xvar="country", yvar=c("val1", "val2"),
##D                        options=list(vAxis="{format:'#,###%'}"))
##D plot(Col4)
## End(Not run)





