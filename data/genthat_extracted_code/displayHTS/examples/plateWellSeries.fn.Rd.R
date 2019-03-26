library(displayHTS)


### Name: plateWellSeries.fn
### Title: Plate-Well Series Plot
### Aliases: plateWellSeries.fn

### ** Examples

   data(HTSdataSort)
   wells = as.character(unique(HTSdataSort[, "WELL_USAGE"])); wells
   colors = c("black",  "yellow", "grey", "blue", "skyblue", "green", "red")
   orders=c(1, 3, 2, 4, 5, 7, 6)
   # by row
   par( mfrow=c(2,1) )                                                        
   plateWellSeries.fn(data.df = HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",              
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow=TRUE,  
                      yRange=NULL, cex.point=0.25,cex.legend=0.3) 
   # by column
   par( mfrow=c(2,1) )                                                        
   plateWellSeries.fn(data.df = HTSdataSort, intensityName="log2Intensity",
                      plateName="BARCODE", wellName="WELL_USAGE",              
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow= FALSE,  
                      yRange=NULL, cex.point=0.25,cex.legend=0.3) 
   # display hits
   data(HTSresults)
   condtSample = HTSresults[, "WELL_USAGE"] == "Sample"
   condtUp = HTSresults[,"ssmd"] >= 1 & HTSresults[,"mean"] >= log2(1.2)
   condtDown = HTSresults[,"ssmd"] <= -1 & HTSresults[,"mean"] <= -log2(1.2)
   sum(condtSample & (condtUp | condtDown) )/sum(condtSample)
   hit.vec = as.character(HTSresults[, "WELL_USAGE"])
   hit.vec[ condtSample & condtUp ] = "up-hit"
   hit.vec[ condtSample & condtDown ] = "down-hit"
   hit.vec[ condtSample & !condtUp & !condtDown] = "non-hit"
   result.df = cbind(HTSresults, "hitResult"=hit.vec)
   wells = as.character(unique(result.df[, "hitResult"])); wells
   orders = c(1, 3, 4, 6, 7, 8, 9, 2, 5) 
   colors = c("black",  "green", "yellow", "red",
              "grey", "purple1", "purple2", "lightblue", "purple3")
   par(mfrow=c(1,1))
   plateWellSeries.fn(data.df = result.df, intensityName="mean",       
                      plateName="SOBARCODE", wellName="hitResult", 
                      rowName="XPOS", colName="YPOS", show.wellTypes=wells,
                      order.wellTypes=orders, color.wells=colors,
                      pch.wells=rep(1, 7), ppf=6, byRow= FALSE,  
                      yRange=NULL, cex.point=0.5,cex.legend=0.55,
                      y.legend=-0.5) 



