library(mrfDepth)


### Name: fheatmap
### Title: Creates MFOD heatmap
### Aliases: fheatmap
### Keywords: Graphical

### ** Examples

library("ggplot2")
data(octane)
Result <- mfd(octane, diagnostic = TRUE, type ="sprojdepth")
Plot <- fheatmap(rowValues = Result$MFDdepthZ,
                 cellValues = Result$crossdepthZ,
                 type = "depth",
                 scalename ="SPD")
                 
Result <- fOutl(octane, diagnostic = TRUE, type ="fAO")
Plot <- fheatmap(rowValues = Result$fOutlyingnessZ,
                 cellValues = Result$crossDistsZ,
                 type = "distance",
                 scalename ="AO")                 
                 
#Customize the look of the plot
#Plot <- Plot + xlab("time point")
#Plot



