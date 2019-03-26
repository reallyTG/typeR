library(geozoning)


### Name: Extreme_Zone
### Title: Extreme_Zone
### Aliases: Extreme_Zone

### ** Examples

## No test: 
 seed=35
 map=genMap(DataObj=NULL,seed=seed,krig=2,typeMod="Exp",nPointsK=500)
 ZK=initialZoning(qProb=c(0.8),map)
 Z=ZK$resZ$zonePolygone # list of zones
 lab = ZK$resZ$lab # label of zones
 plotM(map = map,Z = Z,lab = lab, byLab = FALSE)
 # zone 2 is a zone with maximum label
 numZ = 2
 Estimation = Extreme_Zone(map = map, Z = Z, numZ = numZ, label.is.min = FALSE)
 # compute the cost
 cL = Cost_By_Laplace(map = map, Z = Z, numZ = numZ, Estimation = Estimation)
 cM = Cost_By_Mean(map = map, Z = Z, numZ = numZ)
 print(cL$cost_Laplace)
 print(cM$cost_Mean)
 # zone 2 is homogeneous
## End(No test)



