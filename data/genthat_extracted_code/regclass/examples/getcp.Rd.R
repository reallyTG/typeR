library(regclass)


### Name: getcp
### Title: Complexity Parameter table for partition models
### Aliases: getcp

### ** Examples

  data(JUNK)
	TREE <- rpart(Junk~.,data=JUNK,control=rpart.control(cp=0,xval=10,minbucket=5))
	getcp(TREE)
	 


