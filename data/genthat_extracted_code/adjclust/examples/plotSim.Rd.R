library(adjclust)


### Name: plotSim
### Title: Plot (dis)similarity matrix
### Aliases: plotSim

### ** Examples

# input as HiTC::HTCexp object
## Not run: 
##D if (require("HiTC", quietly = TRUE)) {
##D   load(system.file("extdata", "hic_imr90_40_XX.rda", package = "adjclust"))
##D   plotSim(hic_imr90_40_XX)
##D   
##D   # with a constrained clustering
##D   res <- hicClust(hic_imr90_40_XX, log = TRUE)
##D   selected.capushe <- select(res)
##D   plotSim(hic_imr90_40_XX, clustering = selected.capushe, xaxis = TRUE)
##D   plotSim(hic_imr90_40_XX, clustering = selected.capushe, dendro = res)
##D }
## End(Not run)

plotSim(dist(iris[ ,1:4]), log = FALSE)



