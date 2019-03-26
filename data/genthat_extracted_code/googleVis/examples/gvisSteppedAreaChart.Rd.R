library(googleVis)


### Name: gvisSteppedAreaChart
### Title: Google Stepped Area Chart with R
### Aliases: gvisSteppedAreaChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Stepped Area chart
SteppedArea1 <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"))
plot(SteppedArea1)

## Stacked chart
SteppedArea2 <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"),
      options=list(isStacked=TRUE))
plot(SteppedArea2)


## Add a customised title
SteppedArea3 <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}"))
plot(SteppedArea3)

## Not run: 
##D ## Change y-axis to percentages
##D SteppedArea3 <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"),
##D                        options=list(vAxis="{format:'#,###%'}"))
##D plot(SteppedArea3)
## End(Not run)




