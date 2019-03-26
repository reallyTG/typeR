library(ade4)


### Name: oribatid
### Title: Oribatid mite
### Aliases: oribatid
### Keywords: datasets

### ** Examples

data(oribatid)
ori.xy <- oribatid$xy[, c(2, 1)]
names(ori.xy) <- c("x","y")
plot(ori.xy,pch = 20, cex = 2, asp = 1)

if(requireNamespace("deldir", quietly = TRUE) & requireNamespace("spdep", quietly = TRUE)) {
  plot(deldir::deldir(ori.xy), add = TRUE)
  if(adegraphicsLoaded()) {
    s.label(ori.xy, nb = spdep::knn2nb(spdep::knearneigh(as.matrix(ori.xy), 3)), plab.cex = 0)
  } else {
    s.label(ori.xy, add.p = TRUE, clab = 0, 
      neig = nb2neig(spdep::knn2nb(spdep::knearneigh(as.matrix(ori.xy), 3))))
  }
}



