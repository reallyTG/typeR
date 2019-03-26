library(geozoning)


### Name: new_krigGrid_for_visualisation
### Title: new_krigGrid_for_visualisation
### Aliases: new_krigGrid_for_visualisation

### ** Examples

## No test: 
 seed=2
 map=genMap(DataObj=NULL,seed=seed,krig=2,typeMod="Gau")
 ZK=initialZoning(qProb=c(0.55,0.85),map)
 Z=ZK$resZ$zonePolygone # list of zones
 lab = ZK$resZ$lab # label of zones
 plotM(map = map,Z = Z,lab = lab, byLab = FALSE)
 numZ = 6
 Estimation = Transition_Zone_Near_Boundary(map = map, Z = Z, numZ = numZ)
 result = new_krigGrid_for_visualisation(map = map, Z = Z, numZ = numZ, solution = Estimation)
 new_krigGrid = result$new_krigGrid
 new_data = result$new_data
 quant1 = quantile(map$krigData@data$var1.pred,probs = 0.55)
 quant2 = quantile(map$krigData@data$var1.pred,probs = 0.85)
 # plot initial isocontours
 plotM(map = map,Z = Z,lab = lab, byLab = TRUE)
 listContours = contourBetween(map = map, krigGrid = map$krigGrid, q1 = quant1, q2 = quant2)
 for (i in 1:length(listContours)){
   sp::plot(listContours[[i]]$contour,add=TRUE,col = "red")
 }
 # plot modified isocontours
 plotM(map = map,Z = Z,lab = lab, byLab = TRUE)
 listContours = contourBetween(map = map, krigGrid = new_krigGrid, q1 = quant1, q2 = quant2)
 for (i in 1:length(listContours)){
   sp::plot(listContours[[i]]$contour,add=TRUE,col = "red")
 }
## End(No test)



