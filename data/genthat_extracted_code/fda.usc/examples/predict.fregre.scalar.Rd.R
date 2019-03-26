library(fda.usc)


### Name: predict.fregre.GAM
### Title: Predict method for functional regression model
### Aliases: predict.fregre.lm predict.fregre.plm predict.fregre.glm
###   predict.fregre.gsam predict.fregre.gkam
### Keywords: regression

### ** Examples


## Not run: 
##D data(tecator)
##D ind<-1:129
##D x=tecator$absorp.fdata
##D x.d2<-fdata.deriv(x,nderiv=2)
##D tt<-x[["argvals"]]
##D dataf=as.data.frame(tecator$y)
##D nbasis.x=11;nbasis.b=7
##D basis1=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.x)
##D basis2=create.bspline.basis(rangeval=range(tt),nbasis=nbasis.b)
##D basis.x=list("x.d2"=basis1)
##D basis.b=list("x.d2"=basis2)
##D ldata=list("df"=dataf[ind,],"x.d2"=x.d2[ind])
##D 
##D res=fregre.gsam(Fat~s(Water,k=3)+s(x.d2,k=3),data=ldata,
##D family=gaussian(),basis.x=basis.x,basis.b=basis.b)
##D newldata=list("df"=dataf[-ind,],"x.d2"=x.d2[-ind])
##D pred<-predict.fregre.gsam(res,newldata)
##D plot(pred,tecator$y$Fat[-ind])
##D 
##D res.glm=fregre.glm(Fat~Water+x.d2,data=ldata,family=gaussian(),
##D basis.x=basis.x,basis.b=basis.b)
##D pred.glm<-predict.fregre.glm(res.glm,newldata)
##D newy<-tecator$y$Fat[-ind]
##D points(pred.glm,tecator$y$Fat[-ind],col=2)
##D 
##D res.plm=fregre.plm(Fat~Water+x.d2,data=ldata)
##D pred.plm<-predict.fregre.plm(res.plm,newldata)
##D points(pred.plm,tecator$y$Fat[-ind],col=3)
##D 
##D # Time-consuming 
##D res.gkam=fregre.gkam(Fat~Water+x.d2,data=ldata)
##D pred.gkam=predict(res.gkam,newldata)
##D points(pred.gkam,tecator$y$Fat[-ind],col=4)
##D 
##D ((1/length(newy))*sum((drop(newy)-pred)^2))/var(newy)
##D ((1/length(newy))*sum((newy-pred.plm)^2))/var(newy)    
##D ((1/length(newy))*sum((newy-pred.glm)^2))/var(newy)    
##D ((1/length(newy))*sum((newy-pred.gkam)^2))/var(newy)    
## End(Not run)                                                                                                              



