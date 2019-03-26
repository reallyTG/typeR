library(ecospat)


### Name: ecospat.mdr
### Title: Minimum Dispersal Routes)
### Aliases: ecospat.mdr

### ** Examples

   ## Not run: 
##D library(maps)
##D data(ecospat.testMdr)
##D data<- ecospat.testMdr
##D 
##D fixed.sources.rows<-order(data$date)[1:2] #first introductions
##D 
##D #plot observed situation
##D plot(data[,2:1],pch=15,cex=0.5)
##D points(data[fixed.sources.rows,2:1],pch=19,col="red")
##D text(data[,2]+0.5,data[,1]+0.5,data[,3],cex=0.5)
##D map(add=T)
##D 
##D # mca 
##D obs<-ecospat.mdr(data=data,
##D xcol=2,
##D ycol=1,
##D datecol=3,
##D mode="min",
##D rep=100,
##D mean.date.error=1,
##D fixed.sources.rows)
##D 
##D #plot results
##D lwd<-(obs[[1]]$bootstrap.value)
##D x11();plot(obs[[1]][,3:4],type="n",xlab="longitude",ylab="latitude")
##D arrows(obs[[1]][,1],obs[[1]][,2],obs[[1]][,3],obs[[1]][,4],length = 0.05,lwd=lwd*2)
##D map(add=T)
##D points(data[fixed.sources.rows,2:1],pch=19,col="red")
##D text(data[fixed.sources.rows,2]+0.5,data[fixed.sources.rows,1]+0.5,data[fixed.sources.rows,3],
##D cex=1,col="red")
##D title(paste("total routes length : ",
##D round(obs[[2]],2)," Deg","\n","median dispersal rate : ",
##D round(obs[[3]],2)," Deg/year","\n","number of outcoming nodes : ",
##D obs[[4]]))
## End(Not run)



