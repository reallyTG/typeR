library(displayHTS)


### Name: imageDesign.fn
### Title: Plate Design Image
### Aliases: imageDesign.fn

### ** Examples

# for control image
 data(HTSdataSort)
 wells = as.character(unique(HTSdataSort[, "WELL_USAGE"])); wells
 colors = c("black",  "yellow", "grey", "blue", "skyblue", "green", "red")
 plate.vec = as.vector(HTSdataSort[,"BARCODE"]); plates=unique(plate.vec)
 data.df = HTSdataSort[plate.vec==plates[1], c("XPOS","YPOS","WELL_USAGE")]
 imageDesign.fn(dataOnePlate.df=data.df, wellName="WELL_USAGE", rowName="XPOS",
                 colName="YPOS", wells=wells, colors=colors)

# for hit and control image
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
 colors = c("black",  "green", "white", "grey", "red",
            "purple1", "purple2", "yellow", "purple3")  
 par( mfrow=c(2,1) )
 imageDesign.fn(dataOnePlate.df=result.df[1:384,], wellName="hitResult",
                 rowName="XPOS", colName="YPOS", wells=wells, colors=colors,
                 title="Source Plate I")                
 imageDesign.fn(dataOnePlate.df=result.df[1:384+384,],wellName="hitResult",
                rowName="XPOS", colName="YPOS", wells=wells, colors=colors,
                 title="Source Plate II")



