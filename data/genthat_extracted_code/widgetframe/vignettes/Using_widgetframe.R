## ---- eval=FALSE---------------------------------------------------------
#  install.packages('widgetframe')

## ---- eval=FALSE---------------------------------------------------------
#  if(!require(devtools)) {
#    install.packages('devtools')
#  }
#  devtools::install_github('bhaskarvk/widgetframe')

## ---- eval=FALSE---------------------------------------------------------
#  library(leaflet)
#  library(widgetframe)
#  l <- leaflet() %>% addTiles()
#  htmlwidgets::saveWidget(frameableWidget(l),'leaflet.html')

