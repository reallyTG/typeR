library(geosptdb)


### Name: idwST
### Title: Inverse Distance Weighting (IDW) function for spatio-temporal
###   prediction.
### Aliases: idwST
### Keywords: spatial

### ** Examples

# Loading Croatia data
data(croatiadb)
coordinates(croatiadb) <- ~x+y

# prediction case: one point
point <- data.frame(670863,5043464,5)
names(point) <- c("x","y","t")

coordinates(point) <- ~x+y
idwST(MTEMP~1, data=croatiadb, newdata=point, n.neigh=60, C=1, factor.p=2)

## Not run: 
##D # prediction case: a grid of points Croatia (year 2008)
##D data(croatia)
##D points <- spsample(croatia, n=5000, type="regular")
##D 
##D data(croatiadb)
##D coordinates(croatiadb)<-~x+y
##D 
##D GridsT <- vector(mode = "list", length = 12)
##D 
##D for(i in 1:12){ 
##D GridsT[[i]] <- data.frame(points@coords,i)
##D names(GridsT[[i]]) <- c("x","y","t")
##D }
##D 
##D idw.croatia <- data.frame(matrix(NA, ncol = 14, nrow=nrow(GridsT[[1]])))
##D pb <- txtProgressBar(min = 0, max = 12, char = "=", style = 3)
##D for(i in 1:12){ 
##D coordinates(GridsT[[i]]) <- c("x", "y")
##D idw.croatia[,i+2] <- idwST(MTEMP~1, croatiadb, newdata=GridsT[[i]], n.neigh=10, C=1, 
##D                           factor.p=2, progress=FALSE)[,4]                  
##D setTxtProgressBar(pb, i)
##D }
##D close(pb)
##D 
##D idw.croatia[,1:2] <- GridsT[[1]]@coords
##D nam <- paste(c("ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"),
##D              2008,sep="")
##D names(idw.croatia) <- c("x","y",nam)
##D 
##D coordinates(idw.croatia) <- c("x", "y")
##D gridded(idw.croatia) <- TRUE
##D 
##D # show prediction map
##D pal2 <- colorRampPalette(c("blue3", "wheat1", "red3"))
##D 
##D p1 <- spplot(idw.croatia[,1:12], cuts=30, col.regions=pal2(35), colorkey=F, 
##D             scales = list(draw =T,cex=0.6, abbreviate=TRUE,minlength=1), pch=0.3, 
##D             cex.lab=0.3, cex.title=0.3, auto.key = F, main = "Earth's average 
##D             temperature IDW map 2008", key.space=list(space="right", cex=0.8))
##D 
##D split.screen( rbind(c(0, 1,0,1), c(1,1,0,1)))
##D split.screen(c(1,2), screen=1)-> ind
##D screen( ind[1])
##D p1
##D screen( ind[2])
##D image.plot(legend.only=TRUE, legend.width=0.5, col=pal2(100), 
##D            smallplot=c(0.7,0.75, 0.3,0.7), zlim=c(min(idw.croatia@data),
##D            max(idw.croatia@data)), axis.args = list(cex.axis = 0.7))
##D close.screen( all=TRUE)
## End(Not run)



