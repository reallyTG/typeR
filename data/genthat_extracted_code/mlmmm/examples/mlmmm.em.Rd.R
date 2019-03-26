library(mlmmm)


### Name: mlmmm.em
### Title: ML estimation via EM-algorithm under multivariate linear mixed
###   models with missing values
### Aliases: mlmmm.em
### Keywords: models

### ** Examples
## Not run: 
##D # For a detailed example, see the file "mlmmmmex.s" distributed
##D # with this function. Here is a simple example of how mlmmm.em()
##D # might be used to produce Ml estimates.
##D library(mlmmm)
##D data(adg)
##D y<-cbind(adg$y.1,adg$y.2)
##D colnames(y)=c("adg","initwt")
##D subj=adg$subj
##D # see the relationship between avd and intwt which are jointly modeled
##D library(lattice)
##D xyplot(y[,1]~log(y[,2]) | subj, ylab="Average Daily Gain",xlab="Initial Weight")
##D # below adg$subj is the block or barn
##D subj<-adg$subj
##D pred <- cbind(adg$pred.int,adg$pred.dummy1,adg$pred.dummy2,adg$pred.dummy3)
##D xcol<-1:4
##D zcol<-1
##D unst.psi.result <- mlmmm.em(y,subj,pred,xcol,zcol,maxits=200,eps=0.0001)
## End(Not run)


