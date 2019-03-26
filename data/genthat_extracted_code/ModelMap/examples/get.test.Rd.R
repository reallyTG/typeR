library(ModelMap)


### Name: get.test
### Title: Randomly Divide Data into Training and Test Sets
### Aliases: get.test
### Keywords: models

### ** Examples


qdatafn<-system.file("extdata", "helpexamples","DATATRAIN.csv", package = "ModelMap")

qdata<-read.table(file=qdatafn,sep=",",header=TRUE,check.names=FALSE)

get.test(	proportion.test=0.2,
		qdatafn=qdatafn,
		seed=42,
		folder=getwd(),
		qdata.trainfn="example.train.csv",
		qdata.testfn="example.test.csv")





