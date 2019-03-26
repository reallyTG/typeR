library(bibliometrix)


### Name: thematicMap
### Title: Create a thematic map
### Aliases: thematicMap

### ** Examples


data(scientometrics)
res <- thematicMap(scientometrics, field = "ID", n = 250, minfreq = 5, size = 0.5, repel = TRUE)
plot(res$map)




