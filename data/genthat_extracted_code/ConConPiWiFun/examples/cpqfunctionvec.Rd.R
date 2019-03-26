library(ConConPiWiFun)


### Name: cpqfunctionvec
### Title: This class implements "optimized list" of continuous convex
###   piecewise quadratic functions
### Aliases: cpqfunctionvec Rcpp_cpqfunctionvec-class
###   show,Rcpp_cpqfunctionvec-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

CCPWLfuncList=new(cpqfunctionvec) 
CCPWLfuncList$push_back(new(cpqfunction,c(0),c(1),c(-2, 2),0))
CCPWLfuncList$push_back(new(cpqfunction,c(0),c(1),c(-2, 2),0))

CCPWLfuncList=new(cpqfunctionvec) 
n=1000; Y=rnorm(n); S0=array(0,n)+Y;S1=array(1,n)+Y; B0=array(-Inf,n); B1=array(Inf,n); 
for (i in 1:n){
  CCPWLfuncList$push_back(new(cpqfunction,S0[i],S1[i] ,c(B0[i],B1[i]),0))
}
CCPWLfuncList$size() ## gives the size 
## The same but faster
CCPWLfuncList=new(cpqfunctionvec) 
CCPWLfuncList$SerialPush_0Breaks_Functions(S0,S1);

#### method OptimMargInt solves 
#         		min_x sum_i=1^n C_i(x_i)
#                   Pmoins_i<=	x_i				<=Pplus_i 		i=1,...,n
#					Cmoins_i<=	sum_j=1^i x_j	<=Cplus_i 	i=1,...,n

Pmoins=array(-1,n);Pplus=array(1,n);Cmoins=array(0,n);Cplus=array(5,n);
res=CCPWLfuncList$OptimMargInt(Pmoins,Pplus,Cmoins,Cplus)

par(mfrow=c(1,2))
plot(Y,type='l')
lines(y=Pmoins,x=1:n,col='blue'); lines(y=Pplus,x=1:n,col='blue');
lines(y=res$xEtoile,x=1:n,col='red')
text(x=800,y=3,paste("Optimum=",signif(sum(abs(res$xEtoile-Y)),digits=6)))
plot(Y,type='l',ylim=c(min(Y),max(diffinv(res$xEtoile)[1:n+1])))
lines(y=Cmoins,x=1:n,col='blue'); lines(y=Cplus,x=1:n,col='blue');
lines(y=diffinv(res$xEtoile)[1:n+1],x=1:n,col='red')


rm(list=ls())
gc()






