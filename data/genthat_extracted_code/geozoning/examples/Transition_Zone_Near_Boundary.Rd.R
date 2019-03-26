library(geozoning)


### Name: Transition_Zone_Near_Boundary
### Title: Transition_Zone_Near_Boundary
### Aliases: Transition_Zone_Near_Boundary

### ** Examples

seed=21
map=genMap(DataObj=NULL,seed=seed,krig=2,typeMod="Exp",nPointsK=800)
ZK=initialZoning(qProb=c(0.55,0.85),map)
Z=ZK$resZ$zonePolygone # list of zones
lab = ZK$resZ$lab # label of zones
plotM(map = map,Z = Z,lab = lab, byLab = FALSE)
# zone 3 is a transition zone that has commun boundary with the map
numZ = 3
Estimation = Transition_Zone_Near_Boundary(map = map, Z = Z, numZ = numZ)
# compute the cost
cL = Cost_By_Laplace(map = map, Z = Z, numZ = numZ, Estimation = Estimation)
cM = Cost_By_Mean(map = map, Z = Z, numZ = numZ)
print(cL$cost_Laplace)
print(cM$cost_Mean)
# zone 3 is a zone with gradient



