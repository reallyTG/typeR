library(pgirmess)


### Name: transLines2pix
### Title: Convert a SpatialLines or a SpatialLinesDataFrame object into
###   SpatialPointsDataFrame with spatial points at regular distance along
###   the lines
### Aliases: transLines2pix
### Keywords: utilities, spatial

### ** Examples


# from the sp vignette:
     library(sp)
     l1 = cbind(c(1,2,3),c(3,2,2))
     l1a = cbind(l1[,1]+.05,l1[,2]+.05)
     l2 = cbind(c(1,2,3),c(1,1.5,1))
     Sl1 = Line(l1)
     Sl1a = Line(l1a)
     Sl2 = Line(l2)
     S1 = Lines(list(Sl1, Sl1a), ID="a")
     S2 = Lines(list(Sl2), ID="b")
     Sl = SpatialLines(list(S1,S2))
     plot(Sl, col = c("red", "blue"))
     
     trpt<-transLines2pix(Sl,mindist=0.1)
     plot(trpt,add=TRUE)



