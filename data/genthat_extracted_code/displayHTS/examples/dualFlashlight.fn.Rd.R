library(displayHTS)


### Name: dualFlashlight.fn
### Title: Dual-Flashlight Plot
### Aliases: dualFlashlight.fn

### ** Examples

  # for dual-flashlight plot
  data("HTSresults", package = "displayHTS")
  par( mfrow=c(1, 1) )
  dualFlashlight.fn(HTSresults, wellName="WELL_USAGE", x.name="mean",
                    y.name="ssmd", sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="Average Fold Change", ylab="SSMD",
                    main="Dual-Flashlight Plot", x.legend=NA, y.legend=NA, 
                    cex.point=1, cex.legend = 0.8,
                    xat=log2( c(1/8, 1/4, 1/2, 1, 2, 4, 8) ), 
                    xMark=c("1/8", "1/4", "1/2", "1", "2", "4", "8"),
                    xLines=log2(c(1/4, 1/2 ,1, 2, 4)),
                    yLines=c(-5, -3, -2, -1, 0, 1, 2, 3, 5 ) )
  # for volcano plot
  result.df=cbind(HTSresults,"neg.log10.pval"=-log10(HTSresults[,"p.value"]))
  dualFlashlight.fn(result.df, wellName="WELL_USAGE", x.name="mean",
                    y.name="neg.log10.pval",
                    sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="Average Fold Change", ylab="p-value",
                    main="Volcano Plot", x.legend=NA, y.legend=-log10(0.06), 
                    cex.point=1, cex.legend = 0.8,
                    xat=log2( c(1/8, 1/4, 1/2, 1, 2, 4, 8) ), 
                    xMark=c("1/8", "1/4", "1/2", "1", "2", "4", "8"),
                    yat=-log10( c(0.00001, 0.0001, 0.001, 0.01, 0.1, 1) ), 
                    yMark=c(0.00001, 0.0001, 0.001, 0.01, 0.1, 1),
                    xLines=log2(c(1/4, 1/2 ,1, 2, 4)),
                    yLines=-log10( c( 0.001, 0.01, 0.05) ) )
  # plate pair correlation plot
  data("HTSdataSort", package = "displayHTS")
  data.df= cbind(HTSdataSort[1:384,], HTSdataSort[384+1:384,])
  names(data.df)=
    c("SOBARCODE.1", "BARCODE.1", "XPOS.1", "YPOS.1", "WELL_USAGE.1",   
      "Compound.1", "Intensity.1", "log2Intensity.1",
      "SOBARCODE.2", "BARCODE.2", "XPOS.2", "YPOS.2", "WELL_USAGE.2",   
      "Compound.2", "Intensity.2", "log2Intensity.2")
  dualFlashlight.fn(data.df, wellName="WELL_USAGE.1", x.name="log2Intensity.1",
                    y.name="log2Intensity.2", 
                    sampleName="Sample", sampleColor="black", 
                    controls = c("negCTRL", "posCTRL1", "mock1"),
                    controlColors = c("green", "red", "lightblue"), 
                    xlab="log2 intensity in plate 1",
                    ylab="log2 intensity in plate 2",
                    main="Plate Pair Correlation Plot", x.legend=NA,
                    y.legend=NA, cex.point=1, cex.legend = 0.8 )
  abline(0,1)



