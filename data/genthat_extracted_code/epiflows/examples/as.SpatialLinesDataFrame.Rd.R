library(epiflows)


### Name: as.SpatialLinesDataFrame
### Title: Convert to SpatialLinesDataFrame class
### Aliases: as.SpatialLinesDataFrame as.SpatialLinesDataFrame.epiflows

### ** Examples

data("Brazil_epiflows")
data("YF_coordinates")
ef <- add_coordinates(Brazil_epiflows, YF_coordinates[-1])
ef2 <- epicontacts::thin(ef[j = c("Espirito Santo", "Italy"), contacts = "both"])
as.SpatialLinesDataFrame(ef2)



