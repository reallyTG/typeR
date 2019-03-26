library(ordiBreadth)


### Name: dist.group.plot
### Title: dist.group.plot
### Aliases: dist.group.plot

### ** Examples

testdata<-	
	c(		
			0,0,0,0,1,0,0,0,0,0,#1
			0,0,0,0,0,0,1,1,0,0,#2
			1,1,1,0,0,0,0,0,0,0,#3
			0,0,0,0,1,1,0,1,0,1,#4
			1,1,1,0,0,0,1,0,0,0,#4
			1,1,0,0,1,0,1,0,0,0,#4
			0,0,0,1,0,0,1,0,1,1,#4
			1,0,1,0,1,1,0,0,0,1, #5
			1,1,0,0,1,0,0,1,1,1,#6
			1,1,1,0,1,1,0,1,1,1) #8


dat<-array(dim=c(10,10),data=testdata)
dat<-t(dat)
colnames(dat)<-paste("",LETTERS[1:10],sep="")
rownames(dat)<-paste("bug",1:10,sep="")
x<-ordi.breadth(dat)

dist.group.plot(specialization=x,id=7,cex=1)
dist.group.plot(specialization=x,id=10,cex=1,pt.cex=0.75,plant.plot="points",nrel.pch=1,
nrel.col="black",nrel.cex=0.75)



