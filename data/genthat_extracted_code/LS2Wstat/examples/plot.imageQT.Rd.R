library(LS2Wstat)


### Name: plot.imageQT
### Title: A plot function for quadtree decompositions.
### Aliases: plot.imageQT
### Keywords: plot

### ** Examples


## Not run: 
##D 
##D X<-simTexture(256,K=1,imtype="NS2")[[1]]
##D 
##D XQT<-imageQT(X, bs=100, smooth=FALSE)
##D 
##D XCI <- Tex(XQT$imS, bs=100, smooth=FALSE)
##D 
##D plot(XQT, XCI, QT=T, class=T)
## End(Not run)




