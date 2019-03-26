library(LocalControl)


### Name: LocalControlClassic
### Title: Local Control Classic
### Aliases: LocalControlClassic

### ** Examples

 data(lindner)

 cvars <- c("stent","height","female","diabetic","acutemi",
            "ejecfrac","ves1proc")
 numClusters <- c(1, 2, 10, 15, 20, 25, 30, 35, 40, 45, 50)
 results <- LocalControlClassic( data = lindner,
                                clusterVars = cvars,
                                treatmentColName = "abcix",
                                outcomeColName = "cardbill",
                                clusterCounts = numClusters)
 UPSLTDdist(results,ylim=c(-15000,15000))




