library(ordiBreadth)


### Name: null.breadth.focal.summary
### Title: null.breadth.focal.summary
### Aliases: null.breadth.focal.summary

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

x<-null.breadth.focal(dat)
null.breadth.focal.summary(x)



