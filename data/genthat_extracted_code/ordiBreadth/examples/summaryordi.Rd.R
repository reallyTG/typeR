library(ordiBreadth)


### Name: summaryordi
### Title: summaryordi
### Aliases: summaryordi

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

x<-ordi.focal.drop(dat)
summaryordi(x)



