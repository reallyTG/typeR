library(fisheyeR)


### Name: query2Cols
### Title: Create color vector for elements in an object of class POI
### Aliases: query2Cols

### ** Examples

   data(USArrests)
   usaPOI = POICreate('POI')
   usaPOI@cos.query.docs <-  USArrests[,3] / max(USArrests[,3])  # urban population (1 high - 0 low)
   usaPOI@colores <- query2Cols(usaPOI, 'terrain')
   plot(usaPOI@cos.query.docs, col = usaPOI@colores)
   
   usaPOI@colores <- query2Cols(usaPOI, 'heat')
   plot(usaPOI@cos.query.docs, col = usaPOI@colores)



