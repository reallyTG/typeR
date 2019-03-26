library(bibliometrix)


### Name: plotThematicEvolution
### Title: Plot a Thematic Evolution Analysis
### Aliases: plotThematicEvolution

### ** Examples


data(scientometrics)
years=c(2000)

nexus <- thematicEvolution(scientometrics,field="ID",years=years,n=100,minFreq=2)

#plotThematicEvolution(nexus$Nodes,nexus$Edges)




