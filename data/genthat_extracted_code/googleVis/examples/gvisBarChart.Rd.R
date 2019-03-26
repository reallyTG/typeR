library(googleVis)


### Name: gvisBarChart
### Title: Google Bar Chart with R
### Aliases: gvisBarChart
### Keywords: iplot

### ** Examples


## Please note that by default the googleVis plot command
## will open a browser window and requires an internet
## connection to display the visualisation.

df <- data.frame(country=c("US", "GB", "BR"), 
                           val1=c(1,3,4), 
                           val2=c(23,12,32))

## Bar chart
Bar1 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"))
plot(Bar1)

## Stacked bar chart
Bar2 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
     options=list(isStacked=TRUE))
plot(Bar2)


## Add a customised title and change width of bars
Bar3 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
             options=list(title="Hello World",
                          titleTextStyle="{color:'red',fontName:'Courier',fontSize:16}",
                          bar="{groupWidth:'100%'}"))
plot(Bar3)

## Not run: 
##D ## Change x-axis to percentages
##D Bar4 <- gvisBarChart(df, xvar="country", yvar=c("val1", "val2"),
##D                        options=list(hAxis="{format:'#,###%'}"))
##D plot(Bar4)
##D 
##D ## The following example reads data from a Wikipedia table and displays
##D ## the information in a bar chart.
##D ## We use the readHMLTable function of the XML package to get the data
##D library(XML)
##D ## Get the data of the biggest ISO container companies from Wikipedia
##D ##(table 3):
##D df=readHTMLTable(readLines("http://en.wikipedia.org/wiki/Intermodal_freight_transport"))[[3]][,1:2]
##D ## Rename the second column
##D names(df)[2]="TEU capacity"
##D ## The numbers are displayed with commas to separate thousands, so let's
##D ## get rid of them:
##D df[,2]=as.numeric(gsub(",", "", as.character(df[,2])))
##D 
##D ## Finally we can create a nice bar chart:
##D Bar5 <- gvisBarChart(df, options=list(
##D                     chartArea="{left:250,top:50,width:\"50%\",height:\"75%\"}",
##D                     legend="bottom", 
##D                     title="Top 20 container shipping companies in order of TEU capacity"))
##D 
##D plot(Bar5)
##D 
## End(Not run)




