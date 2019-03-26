library(fda.usc)


### Name: predict.fregre.gls
### Title: Predictions from a functional gls object
### Aliases: predict.fregre.gls predict.fregre.igls
### Keywords: models

### ** Examples

## Not run: 
##D data(tecator)
##D ind<-1:129
##D x <-fdata.deriv(tecator$absorp.fdata,nderiv=1)
##D dataf=as.data.frame(tecator$y)
##D dataf$itime <- 1:nrow(x)
##D ldata=list("df"=dataf[ind,],"x"=x[ind])
##D newldata=list("df"=dataf[-ind,],"x"=x[-ind])
##D newy <- tecator$y$Fat[-ind]
##D ff <- Fat~x
##D res.gls=fregre.gls(ff,data=ldata, correlation=corAR1())
##D pred.gls <- predict.fregre.gls(res.gls,newldata)
##D par.cor <- list("cor.ARMA"=list("index"=c("itime"),"p"=1))
##D res.igls <- fregre.igls(ff,data=ldata,correlation=par.cor) 
##D pred.igls<-predict.fregre.igls(res.igls,newldata,data=newldata$df["index",drop=F])
## End(Not run)



