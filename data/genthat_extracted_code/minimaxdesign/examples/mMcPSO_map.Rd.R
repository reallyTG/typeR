library(minimaxdesign)


### Name: mMcPSO_map
### Title: Compute minimax designs using clustering on a user-provided map
###   (provided as an image file).
### Aliases: mMcPSO_map

### ** Examples

  ## Not run: 
##D     #Generate and plot a minimax design with 20 points on the map of Georgia
##D     library(jpeg)
##D     n <- 25
##D     img <- readJPEG(system.file("img", "gamap.jpg", package="minimaxdesign"))[,,1]
##D     image(t(img)[,nrow(img):1],col=gray.colors(12,start=0.6),main="Georgia")
##D     img <- t(img)[,nrow(img):1] #Invert image due to reading distortion
##D     des <- mMcPSO_map(n,img)
##D     points(des,pch=16)
##D   
## End(Not run)



