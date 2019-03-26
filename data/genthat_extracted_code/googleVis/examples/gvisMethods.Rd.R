library(googleVis)


### Name: gvis Methods
### Title: Print and plot gvis objects
### Aliases: print.gvis plot.gvis
### Keywords: iplot methods print

### ** Examples

## Show gvis options
sapply(c("gvis.print.tag", "gvis.plot.tag", "gvis.tags"), getOption)

M <- gvisMotionChart(Fruits, "Fruit", "Year")
str(M)
## The output for a complete web page
M

## Access only the plot,
M$html$chart

## wrap it in cat and it becomes more readable,
cat(unlist(M$html$chart))

## or use the print function.
print(M, tag="chart")

## Extract the data as a JavaScript function.
print(M, tag="jsData")

## Display the visualisation.
## A web browser with Internet connection and Flash is required.
plot(M)

## Combine with another chart, e.g. table
#tbl <- gvisTable(Fruits, options=list(height=220))
#Mtbl <- gvisMerge(M, tbl)
#plot(Mtbl)


## Example of using googleVis with knitr and markdown

## Not run: 
##D ## Simple knitr/markdown file with googleVis
##D knitrRmd <-"
##D # Markdown example with knitr and googleVis
##D ===========================================
##D This is a little Markdown example file.
##D Set the googleVis options first.
##D In this case change the behaviour of plot.gvis
##D ```{r setOptions, message=FALSE}
##D library(googleVis)
##D op <- options(gvis.plot.tag='chart')
##D ```
##D The following plot statements will automatically return  the HTML
##D required for the 'knitted' output. 
##D 
##D ## Combo chart
##D ```{r ComboExample, results='asis', tidy=FALSE}
##D ## Add the mean
##D CityPopularity$Mean=mean(CityPopularity$Popularity)
##D CC <- gvisComboChart(CityPopularity, xvar='City',
##D           yvar=c('Mean', 'Popularity'),
##D           options=list(seriesType='bars',
##D                        width=450, height=300,
##D                        title='City Popularity',
##D                        series='{0: {type:\"line\"}}'))
##D plot(CC)
##D ```
##D Example of gvisComboChart with R code shown above.
##D 
##D ## Place two charts next to each other
##D ```{r gvisMergeExample, results='asis', echo=FALSE}
##D Geo <- gvisGeoChart(Exports, locationvar='Country', colorvar='Profit', 
##D                     options=list(height=300, width=350)) 
##D Tbl <- gvisTable(Exports, options=list(height=300, width=200))
##D plot(gvisMerge(Geo, Tbl, horizontal=TRUE))
##D ``````
##D Example of a gvisGeoChart with gvisTable and R code hidden.
##D 
##D ## Motion Chart
##D ```{r MotionChartExample, results='asis', tidy=FALSE}
##D M <- gvisMotionChart(Fruits, 'Fruit', 'Year',
##D          options=list(width=400, height=350))
##D plot(M)
##D ```
##D Please note that the Motion Chart is only displayed when hosted on a
##D web server, or is placed in a directory which has been added to the 
##D trusted sources in the [security settings of Macromedia]
##D (http://www.macromedia.com/support/documentation/en/flashplayer/help/settings_manager04.html). 
##D See the googleVis package vignette for more details. 
##D 
##D ```{r resetOptions}
##D ## Set options back to original options
##D options(op)
##D ```
##D "
##D 
##D ## Write the content of knitrRmd into a Rmd-file, knit it and convert it
##D ## into a html output. Finally show the file with the R-help http
##D ## server, this will ensure that also the motion chart is visible.
##D 
##D library(knitr)
##D library(markdown)
##D 
##D wd <- getwd()
##D setwd(tempdir())
##D fn=tempfile()
##D fn.Rmd <- paste(fn, ".Rmd", sep="")
##D fn.md <- paste(fn, ".md", sep="")
##D fn.html <- paste(fn, "-out.html", sep="") 
##D ## Write R Markdown into a file
##D cat(knitrRmd, file=fn.Rmd)
##D render_markdown()
##D knit(fn.Rmd, fn.md)
##D knit2html(fn.md)
##D 
##D ## Open output in browser
##D ## Use plot.gvis which will use the R-help http server
##D ## The URL will start with http://127.0.0.1...
##D ## The HTML file will be copied into a temporary directory
##D plot.gvis(fn.html)
##D ## Compare to browseURL, its URL will start with file://... the motion
##D ## chart is unlikely to be displayed because of Flash security
##D ## settings. See the googleVis vignette for more details. 
##D browseURL(fn.html)
##D setwd(wd)
## End(Not run)

## Not run: 
##D ## Updating the data of an existing googleVis web page
##D 
##D ## Suppose you have an existing web page in which you embedded a
##D ## motion chart with the id "mtnc".
##D ## Now you have a new set of data, but you would like to avoid
##D ## touching the html file again.
##D ## The idea is to write the data and JavaScript functions into separate
##D ## files and to refer to these in the html page.
##D 
##D ## In this example we call the chart id "mtnc"
##D ## To display the example we use the R HTTP server again, and
##D ## write the files into a temp directory
##D 
##D myChartID <- "mtnc"
##D ## baseURL should reflect your web address, e.g. http://myHomePage.com
##D baseURL <- sprintf("http://127.0.0.1:%s/custom/googleVis", tools:::httpdPort)
##D wwwdir <- tempdir() ## the www repository on your computer
##D 
##D   
##D ## Create a motion chart
##D M=gvisMotionChart(Fruits, "Fruit", "Year", chartid=myChartID)
##D 
##D ## Here is our plot again
##D plot(M)
##D 
##D ## Write the data and functions into separate files:
##D cat(M$html$chart['jsData'], file=file.path(wwwdir, "gvisData.js"))
##D cat(M$html$chart[c('jsDrawChart', 'jsDisplayChart', 'jsChart')], 
##D 			    file=file.path(wwwdir, "gvisFunctions.js"))
##D 
##D   
##D ## Create a html page with reference to the above
##D ## JavaScript files
##D   
##D html <- sprintf('
##D <html>
##D   <head>
##D   <script type="text/javascript" src="http://www.google.com/jsapi">
##D   </script>
##D   <script type="text/javascript" src="%s/gvisFunctions.js"></script>
##D   <script type="text/javascript" src="%s/gvisData.js"></script>
##D   <script type="text/javascript">
##D   displayChart%s()
##D   </script>
##D   </head>
##D   <body>
##D   <div id="%s" style="width: 600px; height: 500px;"></div>
##D   </body>
##D   </html>
##D   ', baseURL, baseURL, myChartID, myChartID)
##D   
##D ## Write html scaffold into a file
##D cat(html, file=file.path(wwwdir, paste("Chart", myChartID, ".html", sep="")))
##D 
##D ## Display the result via
##D URL <- paste(baseURL,"/Chart", myChartID, ".html", sep="")
##D browseURL(URL)
##D 
##D ## Update the data, say the data should have shown North and South
##D ## instead of East and West as a location  
##D FruitsUpdate <- Fruits
##D levels(FruitsUpdate$Location)=c("North", "South")
##D 
##D Mupdate=gvisMotionChart(FruitsUpdate, "Fruit", "Year", chartid=myChartID)
##D 
##D ## Only update the file gvisData.js:
##D cat(Mupdate$html$chart['jsData'], file=file.path(wwwdir, "gvisData.js"))
##D 
##D ## Redisplay the chart with the updated data
##D browseURL(URL)
##D 
## End(Not run)



