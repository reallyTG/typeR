library(liquidSVM)


### Name: getSolution
### Title: Retrieve the solution of an SVM
### Aliases: getSolution

### ** Examples

## Not run: 
##D # simple example: regression of sinus curve
##D x <- seq(0,1,by=.01)
##D y <- sin(x*10)
##D a <- lapply(1:5, function(i)getSolution(model <- lsSVM(x,y,d=1), 1,1,i))
##D plot(x,y,type='l',ylim=c(-5,5));
##D for(i in 1:5) lines(coeff~samples, data=a[[i]],col=i)
##D 
##D # a more typical example
##D banana <- liquidData('banana-mc')
##D model <- mcSVM(Y~.,banana$train,d=1)
##D # task 4 is predicting 2 vs 3, there is only cell 1 here
##D solution <- getSolution(model,task=4,cell=1,fold=1)
##D supportvecs <- solution$samples
##D # we are considering task 4 and hence only show labels 2 and 3:
##D bananaSub <- banana$train[banana$train$Y %in% c(2,3),]
##D plot(bananaSub[,-1],col=bananaSub$Y)
##D points(supportvecs,pch='x',cex=2)
## End(Not run)



