library(adjclust)


### Name: select
### Title: Clustering selection
### Aliases: select select.chac

### ** Examples

## Not run: 
##D if (require("HiTC", quietly = TRUE)) {
##D   load(system.file("extdata", "hic_imr90_40_XX.rda", package = "adjclust"))
##D   res <- hicClust(hic_imr90_40_XX, log = TRUE)
##D   selected.capushe <- select(res)
##D   table(selected.capushe)
##D   selected.bs <- select(res, type = "bstick")
##D   table(selected.bs)
##D }
## End(Not run)

res <- adjClust(dist(iris[ ,1:4]))
select.clust <- select(res, "bs")
table(select.clust)




