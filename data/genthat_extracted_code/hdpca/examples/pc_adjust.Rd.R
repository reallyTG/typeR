library(hdpca)


### Name: pc_adjust
### Title: Adjusting shrinkage in PC scores
### Aliases: pc_adjust
### Keywords: multivariate

### ** Examples

data(Example)
#n = 198, p = 75435 for this data

####################################################
## Not run: 
##D #First estimate the number of spikes and then adjust test scores based on that
##D m<-select.nspike(train.eval,p,n,n.spikes.max=10,evals.out=FALSE)$n.spikes
##D score.adj.o1<-pc_adjust(train.eval,p,n,testscore,method="osp",n.spikes=m)
##D score.adj.d1<-pc_adjust(train.eval,p,n,testscore,method="d.gsp",n.spikes=m)
##D score.adj.l1<-pc_adjust(train.eval,p,n,testscore,method="l.gsp",n.spikes=m)
##D 
##D #Or you can provide an upper bound n.spikes.max
##D score.adj.o2<-pc_adjust(train.eval,p,n,testscore,method="osp",n.spikes.max=10)
##D score.adj.d2<-pc_adjust(train.eval,p,n,testscore,method="d.gsp",n.spikes.max=10)
##D score.adj.l2<-pc_adjust(train.eval,p,n,testscore,method="l.gsp",n.spikes.max=10)
##D 
##D #Plot the training score, test score, and adjusted scores
##D plot(trainscore,pch=19)
##D points(testscore,col='blue',pch=19)
##D points(score.adj.o1,col='red',pch=19)
##D points(score.adj.d2,col='green',pch=19)
## End(Not run)



