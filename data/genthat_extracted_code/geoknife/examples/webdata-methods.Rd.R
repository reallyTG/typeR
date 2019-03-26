library(geoknife)


### Name: webdata
### Title: create webdata object
### Aliases: webdata webdata,missing-method webdata,character-method
###   webdata,geojob-method webdata,ANY-method

### ** Examples

webdata('prism')
webdata('prism', times=as.POSIXct(c('1990-01-01', '1995-01-01')))
webdata(list(times = as.POSIXct(c('1895-01-01 00:00:00','1899-01-01 00:00:00')),
 url = 'https://cida.usgs.gov/thredds/dodsC/prism',
 variables = 'ppt'))



