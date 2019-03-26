library(spatstat)


### Name: plot.anylist
### Title: Plot a List of Things
### Aliases: plot.anylist
### Keywords: spatial hplot

### ** Examples

 trichotomy <- list(regular=cells,
                    random=japanesepines,
                    clustered=redwood)
 K <- lapply(trichotomy, Kest)
 K <- as.anylist(K)
 plot(K, main="")

# list of 3D point patterns
 ape1 <- osteo[osteo$shortid==4, "pts", drop=TRUE]
 class(ape1)
 plot(ape1, main.panel="", mar.panel=0.1, hsep=0.7, vsep=1,
      cex=1.5, pch=21, bg='white')



