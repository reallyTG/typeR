library(gap)


### Name: mhtplot
### Title: Manhattan plot
### Aliases: mhtplot
### Keywords: hplot

### ** Examples

## Not run: 
##D # foo example
##D test <- matrix(c(1,1,4,1,1,6,1,10,3,2,1,5,2,2,6,2,4,8),byrow=TRUE,6)
##D mhtplot(test)
##D mhtplot(test,mht.control(logscale=FALSE))
##D 
##D # fake example with Affy500k data
##D affy <-c(40220, 41400, 33801, 32334, 32056, 31470, 25835, 27457, 22864, 28501, 26273, 
##D          24954, 19188, 15721, 14356, 15309, 11281, 14881, 6399, 12400, 7125, 6207)
##D CM <- cumsum(affy)
##D n.markers <- sum(affy)
##D n.chr <- length(affy)
##D test <- data.frame(chr=rep(1:n.chr,affy),pos=1:n.markers,p=runif(n.markers))
##D 
##D # to reduce size of the plot
##D # bitmap("mhtplot.bmp",res=72*5)
##D oldpar <- par()
##D par(cex=0.6)
##D colors <- rep(c("blue","green"),11)
##D # other colors, e.g.
##D # colors <- c("red","blue","green","cyan","yellow","gray","magenta","red","blue","green",
##D #             "cyan","yellow","gray","magenta","red","blue","green","cyan","yellow","gray",
##D #             "magenta","red")
##D mhtplot(test,control=mht.control(colors=colors),pch=19,srt=0)
##D title("A simulated example according to EPIC-Norfolk QCed SNPs")
##D axis(2)
##D axis(1,pos=0,labels=FALSE,tick=FALSE)
##D abline(0,0)
##D # dev.off()
##D par(oldpar)
##D 
##D mhtplot(test,control=mht.control(usepos=TRUE,colors=colors,gap=10000),pch=19,bg=colors)
##D title("Real positions with a gap of 10000 bp between chromosomes")
##D box()
##D 
##D png("manhattan.png",height=3600,width=6000,res=600)
##D opar <- par()
##D par(cex=0.4)
##D ops <- mht.control(colors=rep(c("lightgray","lightblue"),11),srt=0,yline=2.5,xline=2)
##D mhtplot(mhtdata[,c("chr","pos","p")],ops,xlab="",ylab="",srt=0)
##D axis(2,at=1:16)
##D title("An adaptable plot as .png")
##D par(opar)
##D dev.off()
##D 
##D data <- with(mhtdata,cbind(chr,pos,p))
##D glist <- c("IRS1","SPRY2","FTO","GRIK3","SNED1","HTR1A","MARCH3","WISP3","PPP1R3B",
##D          "RP1L1","FDFT1","SLC39A14","GFRA1","MC4R")
##D hdata <- subset(mhtdata,gene%in%glist)[c("chr","pos","p","gene")]
##D color <- rep(c("lightgray","gray"),11)
##D glen <- length(glist)
##D hcolor <- rep("red",glen)  
##D par(las=2, xpd=TRUE, cex.axis=1.8, cex=0.4)
##D ops <- mht.control(colors=color,yline=1.5,xline=3,labels=paste("chr",1:22,sep=""),
##D                    srt=270)
##D hops <- hmht.control(data=hdata,colors=hcolor)
##D mhtplot(data,ops,hops,pch=19)
##D axis(2,pos=2,at=1:16)
##D title("Manhattan plot with genes highlighted",cex.main=1.8)
##D 
##D mhtplot(data,mht.control(cutoffs=c(4,6,8,16)),pch=19)
##D title("Another plain Manhattan plot")
##D 
## End(Not run)



