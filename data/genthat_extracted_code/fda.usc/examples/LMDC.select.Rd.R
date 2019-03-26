library(fda.usc)


### Name: LMDC.select
### Title: Impact points selection of functional predictor and regression
###   using local maxima distance correlation (LMDC)
### Aliases: LMDC.select LMDC.regre
### Keywords: regression

### ** Examples

## Not run: 
##D data(tecator)
##D absorp=fdata.deriv(tecator$absorp.fdata,2)
##D ind=1:129
##D x=absorp[ind,]
##D y=tecator$y$Fat[ind]
##D newx=absorp[-ind,]
##D newy=tecator$y$Fat[-ind]
##D 
##D ## Functional PC regression
##D res.pc=fregre.pc(x,y,1:6)
##D pred.pc=predict.fregre.fd(res.pc,newx)
##D 
##D # Functional regression with basis representation
##D res.basis=fregre.basis.cv(x,y)
##D pred.basis=predict.fregre.fd(res.basis,newx)
##D 
##D # Functional nonparametric regression
##D res.np=fregre.np.cv(x,y)
##D pred.np=predict.fregre.fd(res.np,newx)
##D 
##D dat    <- data.frame("y"=y,x$data)
##D newdat <- data.frame("y"=newy,newx$data)
##D 
##D res.gam=fregre.gsam(y~s(x),data=list("df"=dat,"x"=x))
##D pred.gam=predict.fregre.gsam(res.gam,list("x"=newx))
##D 
##D 
##D 
##D dc.raw <- LMDC.select("y",data=dat, tol = 0.05, pvalue= 0.05,
##D                       plot=F, smo=T,verbose=F)
##D covar <- paste("X",dc.raw$maxLocal,sep="")                      
##D # Preselected design/impact points 
##D covar
##D ftest<-flm.test(dat[,-1],dat[,"y"], B=500, verbose=F,
##D     plot.it=F,type.basis="pc",est.method="pc",p=4,G=50)
##D     
##D if (ftest$p.value>0.05) { 
##D   # Linear relationship, step-wise lm is recommended
##D   out <- LMDC.regre("y",covar,dat,newdat,pvalue=.05,
##D               method ="lm",plot=F,verbose=F)
##D } else {
##D  # Non-Linear relationship, step-wise gam is recommended
##D   out <- LMDC.regre("y",covar,dat,newdat,pvalue=.05,
##D               method ="gam",plot=F,verbose=F) }  
##D              
##D # Final  design/impact points
##D out$xvar
##D 
##D # Predictions
##D mean((newy-pred.pc)^2)                
##D mean((newy-pred.basis)^2) 
##D mean((newy-pred.np)^2)              
##D mean((newy-pred.gam)^2) 
##D mean((newy-out$pred)^2)
## End(Not run)                          



