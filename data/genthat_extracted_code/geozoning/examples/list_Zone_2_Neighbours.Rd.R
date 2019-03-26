library(geozoning)


### Name: list_Zone_2_Neighbours
### Title: list_Zone_2_Neighbours
### Aliases: list_Zone_2_Neighbours

### ** Examples

## No test: 
 seed=20
 map=genMap(DataObj=NULL,seed=seed,krig=2,typeMod="Exp")
 ZK=initialZoning(qProb=c(0.67,0.8),map)
 Z=ZK$resZ$zonePolygone # list of zones
 lab = ZK$resZ$lab # label of zones
 plotM(map = map,Z = Z,lab = lab, byLab = FALSE)
 # zone 5 and 11 are transition zones and have exactly 2 neighbours with different labels.
 list_Zone_2_Neighbours(Z = Z, lab = lab)
## End(No test)



