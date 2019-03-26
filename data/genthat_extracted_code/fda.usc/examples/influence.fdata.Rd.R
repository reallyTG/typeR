library(fda.usc)


### Name: influnce.fdata
### Title: Functional influence measures
### Aliases: influence.fdata
### Keywords: outliers

### ** Examples

## Not run: 
##D data(tecator)
##D x=tecator$absorp.fdata[1:129]
##D y=tecator$y$Fat[1:129]
##D 
##D res1=fregre.pc(x,y,1:5)  
##D # time consuming
##D res.infl1=influence.fdata(res1)  
##D res2=fregre.basis(x,y)  
##D res.infl2=influence.fdata(res2)  
##D 
##D res<-res1
##D res.infl<-res.infl1
##D mat=cbind(y,res$fitted.values,res.infl$DCP,res.infl$DCE,res.infl$DP)
##D colnames(mat)=c("Resp.","Pred.","DCP","DCE","DP")
##D pairs(mat)
## End(Not run)




