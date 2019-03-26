library(mvcluster)


### Name: mvsvdl1
### Title: Multi-view bi-clustering via SSVD
### Aliases: mvsvdl1

### ** Examples

		library(mvcluster)
		data(phe)
		data(gen)
        views <- list(phe,gen)
        result <- mvsvdl1(views,c(0.45,0.65),0.016)



