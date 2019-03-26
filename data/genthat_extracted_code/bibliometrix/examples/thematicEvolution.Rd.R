library(bibliometrix)


### Name: thematicEvolution
### Title: Perform a Thematic Evolution Analysis
### Aliases: thematicEvolution

### ** Examples


data(scientometrics)
years=c(2000)

nexus <- thematicEvolution(scientometrics,field="ID", years=years, n=100,minFreq=2)




