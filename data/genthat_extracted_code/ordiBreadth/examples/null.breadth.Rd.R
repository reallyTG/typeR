library(ordiBreadth)


### Name: null.breadth
### Title: null.breadth
### Aliases: null.breadth

### ** Examples

testdata<-	
	c(		
			0,0,0,0,1,0,0,0,0,0,
			0,0,0,0,0,0,1,1,0,0,
			1,1,1,0,0,0,0,0,0,0,
			0,0,0,0,1,1,0,1,0,1,
			1,1,1,0,0,0,1,0,0,0,
			1,1,0,0,1,0,1,0,0,0,
			0,0,0,1,0,0,1,0,1,1,
			1,0,1,0,1,1,0,0,0,1, 
			1,1,0,0,1,0,0,1,1,1,
			1,1,1,0,1,1,0,1,1,1) 


dat<-array(dim=c(10,10),data=testdata)
dat<-t(dat)
colnames(dat)<-paste("",LETTERS[1:10],sep="")
rownames(dat)<-paste("bug",1:10,sep="")

null.breadth(dat)



