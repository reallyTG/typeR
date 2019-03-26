library(IDmining)


### Name: MINDEX_SP
### Title: The Multipoint Morisita Index for Spatial Patterns
### Aliases: MINDEX_SP

### ** Examples

sim_dat <- SwissRoll(1000)

m <- 2
scaleQ <- 1:15 # It starts with a grid of 1^2 cell (or quadrat).
               # It ends with a grid of 15^2 cells (or quadrats).
mMI <- MINDEX_SP(sim_dat[,c(1,2)], scaleQ, m, 5)

plot(mMI[,1],mMI[,2],pch=19,col="black",xlab="",ylab="")
title(xlab=expression(delta),cex.lab=1.5,line=2.5)
title(ylab=expression(I['2,'*delta]),cex.lab=1.5,line=2.5)

## Not run: 
##D require(colorRamps)
##D colfunc <- colorRampPalette(c("blue","red"))
##D color <- colfunc(4)
##D dev.new(width=5,height=4)
##D plot(mMI[5:15,1],mMI[5:15,2],pch=19,col=color[1],xlab="",ylab="",
##D      ylim=c(1,max(mMI[,5])))
##D title(xlab=expression(delta),cex.lab=1.5,line=2.5)
##D title(ylab=expression(I['2,'*delta]),cex.lab=1.5,line=2.5)
##D for(i in 3:5){
##D   points(mMI[5:15,1],mMI[5:15,i],pch=19,col=color[i-1])
##D }
##D legend.text<-c("m=2","m=3","m=4","m=5")
##D legend.pch=c(19,19,19,19)
##D legend.lwd=c(NA,NA,NA,NA)
##D legend.col=c(color[1],color[2],color[3],color[4])
##D legend("topright",legend=legend.text,pch=legend.pch,lwd=legend.lwd,
##D        col=legend.col,ncol=1,text.col="black",cex=0.9,box.lwd=1,bg="white")
##D 
##D xlim_l <- c(-5,5)     # By default, the spatial extent of the grid is set so
##D ylim_l <- c(-6,6)     # that it is the same as the spatial extent of the data.
##D xlim_s <- c(-0.6,0.2) # But it can be modified to cover either a larger (l)
##D ylim_s <- c(-1,0.5)   # or a smaller (s) study area (or validity domain).
##D 
##D mMI_l <- MINDEX_SP(sim_dat[,c(1,2)], scaleQ, m, 5, xlim_l, ylim_l)
##D mMI_s <- MINDEX_SP(sim_dat[,c(1,2)], scaleQ, m, 5, xlim_s, ylim_s)
## End(Not run)



