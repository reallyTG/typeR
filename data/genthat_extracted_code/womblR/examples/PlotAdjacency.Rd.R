library(womblR)


### Name: PlotAdjacency
### Title: PlotAdjacency
### Aliases: PlotAdjacency

### ** Examples

###Define blind spot locations on the HFA-II
blind_spot <- c(26, 35)

###Load visual field adjacency matrix
W <- HFAII_Queen[ -blind_spot, -blind_spot]

###Load Garway-Heath angles for dissimiliarity metric
DM <- GarwayHeath[-blind_spot] #Uses Garway-Heath angles object "GarwayHeath"

###Adjacency plots
PlotAdjacency(W = W, DM = DM, zlim = c(0, 180), Visit = NA,
              main = "Garway-Heath dissimilarity metric\n across the visual field")




