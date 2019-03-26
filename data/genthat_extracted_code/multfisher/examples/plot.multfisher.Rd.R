library(multfisher)


### Name: plot.multfisher
### Title: Plot Rejection Region from a 'multfisher' Object
### Aliases: plot.multfisher

### ** Examples

## Example with two endpoints
data<-data.frame(endpoint1=c(0,0,1,1,1,0,0,0,0,1,1,1,1,1,1, 0,0,1,0,0,1,1,1,1,1,1,1,1,1,1),
		endpoint2=  c(0,0,0,0,0,1,1,1,1,1,1,1,1,1,1, 0,0,0,1,1,1,1,1,1,1,1,1,1,1,1),
		group=rep(c(0,1),each=15))
plot(mfisher.test(x=data[,c(1:2)],y=data$group,show.region=TRUE),cex=2)

## Example with three endpoints
data3EP<-data.frame(endpoint1=  c(0,0,0,0,0,1,1,0,0,0, 0,0,0,0,1,1,1,1,1,1),
		  endpoint2=  c(0,0,0,0,0,1,0,1,0,0, 0,0,1,1,1,1,1,1,1,1),
		  endpoint3=  c(0,0,0,0,0,0,0,0,1,1, 0,0,0,1,1,1,1,1,1,1),
		  group=rep(c(0,1),each=10))
testgreedy3EP<-mfisher.test(x=data3EP[,1:3],y=data3EP$group,method="alpha.greedy",
	show.region=TRUE,closed.test=TRUE)
## Projecion on the first two dimensions
plot(testgreedy3EP,dim=c(1,2),cex=2)
## Slice at a value of 5 for the third dimension
plot(testgreedy3EP,dim=c(1,2),slice=list(T3=5),cex=2)
## Show all slices through the third dimension
par(mfrow=c(3,3))
for(i in 1:9) {
plot(testgreedy3EP,dim=c(1,2),slice=list(T3=i),show.titles=FALSE,cex=2,xlim=c(0,8),ylim=c(0,10))
title(paste("T3 =",i))
}




