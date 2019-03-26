library(ordiBreadth)


### Name: hyp.ordi.breadth
### Title: hyp.ordi.breadth
### Aliases: hyp.ordi.breadth

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

group<-c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE)
hyp.ordi.breadth(dat,group)
hyp.ordi.breadth(dat,group,distance=TRUE)

group<-c(1,1,1,1,1,1,1,1,1,1)
hyp.ordi.breadth(dat,group)#extreme generalist
hyp.ordi.breadth(dat,group,distance=TRUE)




