library(fda.usc)


### Name: predict.fregre.fd
### Title: Predict method for functional linear model (fregre.fd class)
### Aliases: predict.fregre.fd
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D absorp=tecator$absorp.fdata
##D ind=1:129
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D newx=absorp[-ind,]
##D newy=matrix(tecator$y$Fat[-ind],ncol=1)
##D ## Functional PC regression
##D res.pc=fregre.pc(x,y,1:6)
##D pred.pc=predict.fregre.fd(res.pc,newx)
##D # Functional PLS regression
##D res.pls=fregre.pls(x,y,1:6)
##D pred.pls=predict.fregre.fd(res.pls,newx)
##D # Functional nonparametric regression
##D res.np=fregre.np(x,y,Ker=AKer.tri,metric=semimetric.deriv)
##D pred.np=predict.fregre.fd(res.np,newx)
##D # Functional regression with basis representation
##D res.basis=fregre.basis.cv(x,y)
##D pred.basis=predict.fregre.fd(res.basis,newx)
##D  
##D dev.new()
##D plot(pred.pc-newy)
##D points(pred.pls-newy,col=2,pch=2)
##D points(pred.np-newy,col=3,pch=3)
##D points(pred.basis-newy,col=4,pch=4)
##D sum((pred.pc-newy)^2,na.rm=TRUE)/sum((newy-mean(newy))^2,na.rm=TRUE)
##D sum((pred.pls-newy)^2,na.rm=TRUE)/sum((newy-mean(newy))^2,na.rm=TRUE)
##D sum((pred.np-newy)^2,na.rm=TRUE)/sum((newy-mean(newy))^2,na.rm=TRUE)
##D sum((pred.basis-newy)^2,na.rm=TRUE)/sum((newy-mean(newy))^2,na.rm=TRUE)
## End(Not run)



