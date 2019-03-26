library(DataVisualizations)


### Name: Choroplethmap
### Title: Plot the Choropleth Map
### Aliases: plotChoroplethMap Choroplethmap
### Keywords: choropleth choropleth map political map Germany zip codes
###   postal codes thematic map

### ** Examples


#If you download the package from CRAN
## No test: 
# 1. Step: Downlaod the shape file from the website 
# www.deepbionics.org/Projects/DataVisualizations.html
# 2. Step: load it from the local path od the downloaded file with
load(file='GermanPostalCodesShapes.rda')
## End(No test)

# If you download the package from GitHub, you can omit the two steps above.
# Then, do not use the 'PostalCodesShapes' input parameter

#Many postal codes are required to see a structure
#Exemplary two postal codes in the upper left corner of the map

## No test: 
out=Choroplethmap(c(4,8,5,4),

c('49838', '26817', '49838', '26817'),

NumberOfBins=2,PlotIt=FALSE,
 PostalCodesShapes=GermanPostalCodesShapes)

out$chorR6obj$render()
## End(No test)
#bins are only presented in the map if the have values within
## No test: 
out=Choroplethmap(c(4,8,5,4),c('49838', '26817',

 '49838', '26817'),NumberOfBins=5,
 
 Breaks4Intervals=c(1,2,3,5,10),PlotIt=FALSE,
 PostalCodesShapes=GermanPostalCodesShapes)


out$chorR6obj$render()
## End(No test)
# Result of [Thrun/Ultsch, 2018]
# Slightly misuse the function for visualizing a political map 
# resulting out of a clustering

## No test: 
data('ChoroplethPostalCodesAndAGS_Germany')
res=Choroplethmap(as.numeric(ChoroplethPostalCodesAndAGS_Germany$Cls)+1,

ChoroplethPostalCodesAndAGS_Germany$PLZ,NumberOfBins = 2,

Breaks4Intervals = c(0,1,2,3,4,5,6),digits = 1,ReferenceMap = F,

DiscreteColors = c('white','green','blue','red','magenta'),

main = 'Classification of German Postal Codes based on Income Tax Share and Yield',

legend = 'ITS vs MTY Classification in 2010',NAcolor = 'black',PlotIt=FALSE,
 PostalCodesShapes=GermanPostalCodesShapes)


#takes time to process
res$chorR6obj$render()
## End(No test)



