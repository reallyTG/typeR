library(forestFloor)


### Name: plot_simplex3
### Title: 3-class simplex forestFloor plot
### Aliases: plot_simplex3

### ** Examples

## Not run: 
##D   library(randomForest)
##D   library(forestFloor)
##D   require(utils)
##D   
##D   data(iris)
##D 
##D   X = iris[,!names(iris) %in% "Species"]
##D   Y = iris[,"Species"]
##D   as.numeric(Y)
##D   rf.test42 = randomForest(X,Y,keep.forest=TRUE,
##D     replace=FALSE,keep.inbag=TRUE,samp=15,ntree=100)
##D   ff.test42 = forestFloor(rf.test42,X,calc_np=FALSE,binary_reg=FALSE)
##D   
##D   plot(ff.test42,plot_GOF=TRUE,cex=.7,
##D        colLists=list(c("#FF0000A5"),
##D                      c("#00FF0050"),
##D                      c("#0000FF35")))
##D   
##D   show3d(ff.test42,1:2,3:4,plot_GOF=TRUE)
##D   
##D   #plot all effect 2D only
##D   pars = plot_simplex3(ff.test42,Xi=c(1:3),restore_par=FALSE,zoom.fit=NULL,
##D     var.col=NULL,fig.cols=2,fig.rows=1,fig3d=FALSE,includeTotal=TRUE,auto.alpha=.4
##D     ,set_pars=TRUE)
##D   
##D   pars = plot_simplex3(ff.test42,Xi=0,restore_par=FALSE,zoom.fit=NULL,
##D     var.col=alist(alpha=.3,cols=1:4),fig3d=FALSE,includeTotal=TRUE,
##D     auto.alpha=.8,set_pars=FALSE)
##D   
##D   for (I in ff.test42$imp_ind[1:4])  {
##D     #plotting partial OOB-CV separation(including interactions effects)
##D     #coloured by true class
##D     pars = plot_simplex3(ff.test42,Xi=I,restore_par=FALSE,zoom.fit=NULL,
##D     var.col=NULL,fig.cols=4,fig.rows=2,fig3d=TRUE,includeTotal=FALSE,label.col=1:3,
##D     auto.alpha=.3,set_pars = (I==ff.test42$imp_ind[1]))
##D     
##D     #coloured by varaible value
##D     pars = plot_simplex3(ff.test42,Xi=I,restore_par=FALSE,zoom.fit=TRUE,
##D     var.col=alist(order=FALSE,alpha=.8),fig3d=FALSE,includeTotal=(I==4),
##D     auto.alpha=.3,set_pars=FALSE)
##D   }
## End(Not run)



