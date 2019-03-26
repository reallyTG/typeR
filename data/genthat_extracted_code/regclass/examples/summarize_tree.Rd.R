library(regclass)


### Name: summarize_tree
### Title: Useful summaries of partition models from rpart
### Aliases: summarize.tree summarize_tree

### ** Examples

  data(WINE)
	TREE <- rpart(Quality~.,data=WINE,control=rpart.control(cp=0.01,xval=10,minbucket=5))
	summarize_tree(TREE)
	RF <- randomForest(Quality~.,data=WINE)
	summarize_tree(RF)
	
	data(NFL)
	TREE <- rpart(X4.Wins~.,data=NFL,control=rpart.control(cp=0.002,xval=10,minbucket=5))
	summarize_tree(TREE)
	RF <- randomForest(X4.Wins~.,data=NFL,ntrees=500)
	summarize_tree(RF)
	 


