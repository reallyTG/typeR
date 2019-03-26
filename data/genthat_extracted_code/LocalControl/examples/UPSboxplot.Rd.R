library(LocalControl)


### Name: UPSboxplot
### Title: Returns a series of boxplots comparing LTD distributions given
###   different numbers of clusters.
### Aliases: UPSboxplot

### ** Examples


data(lindner)
cvars <- c("stent","height","female","diabetic","acutemi",
           "ejecfrac","ves1proc")
numClusters <- c(1, 5, 10, 20, 40, 50)

results <- LocalControlClassic(data = lindner,
                               clusterVars = cvars,
                               treatmentColName = "abcix",
                               outcomeColName = "cardbill",
                               clusterCounts = numClusters)

bxp <- UPSboxplot(results)




