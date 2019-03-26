library(prettyR)


### Name: rep_n_stack
### Title: Replicate and stack columns of a data frame
### Aliases: rep_n_stack
### Keywords: misc

### ** Examples

 wide.data<-data.frame(ID=1:10,Glup=sample(c("Montic","Subtic"),10,TRUE),
  Flimit1=runif(10,1,2),Flimit2=runif(10,1.5,2.5),Flimit3=runif(10,1.2,3),
  Glimit1=rnorm(10,mean=5),Glimit2=rnorm(10,mean=4),Glimit3=rnorm(10,mean=4.5))
 # first just stack one set of related measures
 rep_n_stack(wide.data[,1:5],to.stack=c("Flimit1","Flimit2","Flimit3"))
 # now stack two sets of related measures and pass names for the stacks
 rep_n_stack(wide.data,to.stack=matrix(3:8,nrow=2,byrow=TRUE),
  stack.names=c("Limit_F","Value_F","Limit_G","Value_G"))
 # finally stack a matrix of means into a single column with the
 # row and column names becoming "factor" variables
 meanmat<-matrix(runif(16,10,20),nrow=4)
 rownames(meanmat)<-c("Plunderers","Storers","Refusers","Jokers")
 colnames(meanmat)<-c("Week1","Week2","Week3","Week4")
 rep_n_stack(meanmat,to.stack=1:4,
  stack.names=c("Returns","Occasion","Strategy"))



