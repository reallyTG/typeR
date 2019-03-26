library(fisheyeR)


### Name: POIPlot
### Title: Plot Objects of Class POI
### Aliases: POIPlot

### ** Examples

   ## rgb colors 
   rgbPOI = POICreate(type = 'POI', wordsInQuery = c('red','green','blue'),
                       colores = colors(), itemsCol = colors(),
                       docs = cbind(colors(), 1:length(colors())),
                       cos.query.docs = rep(1,length(colors())),
                       matrizSim = t(col2rgb(colors())) / max(t(col2rgb(colors())))
   )
   POIcoords(rgbPOI) <- POICalc(rgbPOI ,length(rgbPOI@wordsInQuery))
   rgbPOI@itemsFamily <- '' # R cmd check passing in examples
   try(rm('POI.env'), silent = T)
   POIPlot(rgbPOI)



