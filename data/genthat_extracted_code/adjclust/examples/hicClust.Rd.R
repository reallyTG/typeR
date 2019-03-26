library(adjclust)


### Name: hicClust
### Title: Adjacency-constrained Clustering of Hi-C contact maps
### Aliases: hicClust

### ** Examples

# input as HiTC::HTCexp object
## Not run: 
##D if (require("HiTC", quietly = TRUE)) {
##D   load(system.file("extdata", "hic_imr90_40_XX.rda", package = "adjclust"))
##D   res1 <- hicClust(hic_imr90_40_XX)
##D }
## End(Not run)

# input as Matrix::dsCMatrix contact map
## Not run: 
##D mat <- HiTC::intdata(hic_imr90_40_XX) 
##D res2 <- hicClust(mat)
## End(Not run)

# input as text file
res3 <- hicClust(system.file("extdata", "sample.txt", package = "adjclust"))




