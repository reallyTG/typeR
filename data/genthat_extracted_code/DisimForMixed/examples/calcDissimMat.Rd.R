library(DisimForMixed)


### Name: calcDissimMat
### Title: Calculate Dissimilarity Matrix for Mixed Attributes.
### Aliases: calcDissimMat

### ** Examples

QualiVars <- data.frame(Qlvar1 = c("A","B","A","C","C","A"), Qlvar2 = c("Q","Q","R","Q","R","Q"))
QuantVars <- data.frame(Qnvar1 = c(1.5,3.2,4.9,5,2.8,3.1), Qnvar2 = c(4.8,2,1.1,5.8,3.1,2.2))
DisSimMatCalcd <- calcDissimMat(QualiVars, QuantVars)

agnesClustering <- cluster::agnes(DisSimMatCalcd, diss = TRUE, method = "ward")
silWidths <- cluster::silhouette(cutree(agnesClustering, k = 2), DisSimMatCalcd)
mean(silWidths[,3])
plot(agnesClustering)

PAMClustering <- cluster::pam(DisSimMatCalcd, k=2, diss = TRUE)
silWidths <- cluster::silhouette(PAMClustering, DisSimMatCalcd)
plot(silWidths)



