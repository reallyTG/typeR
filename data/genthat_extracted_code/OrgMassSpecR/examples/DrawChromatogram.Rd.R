library(OrgMassSpecR)


### Name: DrawChromatogram
### Title: Plot a Chromatogram
### Aliases: DrawChromatogram

### ** Examples

## single peak
x <- DrawChromatogram(example.chromatogram.single$time,  
                      example.chromatogram.single$intensity/100, 
                      range = list(start = 25.4, stop = 26.1), 
                      main = "example chromatogram 1",
                      ylab = "intensity x 100")
# label peak with retention time and area
text(x$retentionTime, x$apexIntensity + 1500, 
     labels = paste("RT = ", round(x$retentionTime, digits = 1),
                    ", Area = ", round(x$peakArea), sep = ""), cex = 0.9) 

## multiple peaks 
y <- DrawChromatogram(example.chromatogram.multiple$time, 
                      example.chromatogram.multiple$intensity / 1000, 
                      range = list(start = c(21.5, 21.925, 23.1, 25.5, 27.35), 
                        stop = c(21.925, 22.4, 23.6, 26.2, 28.0)),
                      color = c("blue", "red", "green", "yellow", "orange"), 
                      xlab = "retention time (min)", 
                      ylab = "intensity x 1000 (cps)", 
                      main = "Example Chromatogram")
## label peaks
text(y$retentionTime, y$apexIntensity + 50, labels = c("a", "b", "c", "d", "e"))



