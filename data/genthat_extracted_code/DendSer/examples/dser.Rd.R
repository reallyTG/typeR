library(DendSer)


### Name: dser
### Title: Implements dendrogram seriation. Interface to DendSer.
### Aliases: dser dser.hclust dser.data.frame dser.matrix dser.dist

### ** Examples

	 			
require(DendSer) 			

iriss <- scale(iris[,-5])
plotAsColor(iriss,order.row=dser(iriss))



w <- prcomp(iris[,-5],scale=TRUE)$x[,1]
h<- hclust(dist(iriss))
h$order <- ow <- dser(h,w,cost=costLS) # arranges cases along first PC, within dendrogram


# compare re-rordered dendrogram to PC scores, w
dev.new(width=10,height=5)
par(mar=c(0,2,1,1))
layout(matrix(1:2, nrow = 2), heights = c(4,1.5) )
par(cex=.7)
plot(h,main="",xlab="",hang=-1,labels=FALSE)
u <- par("usr")
par(mar=c(1,2,0,1))
 

plot.new()
par(usr=c(u[1:2],min(w),max(w)))

x<- 1:length(w)
rect(x-.5,0,x+.5,w[ow],col=cutree(h,3)[ow]+1)




