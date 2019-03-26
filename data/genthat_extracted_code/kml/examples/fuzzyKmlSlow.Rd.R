library(kml)


### Name: fuzzyKmlSlow
### Title: ~ Algorithm fuzzy kml: Fuzzy k-means for Longitidinal data ~
### Aliases: fuzzyKmlSlow
### Keywords: classif cluster nonparametric ts robust

### ** Examples

### Data generation
traj <- gald(25)["traj"]
partInit <- initializePartition(3,100,"kmeans--",traj)

### fuzzy Kml
partResult <- fuzzyKmlSlow(traj,partInit)



