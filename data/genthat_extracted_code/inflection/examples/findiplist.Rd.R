library(inflection)


### Name: findiplist
### Title: The Extremum Surface Estimator (ESE) and Extremum Distance
###   Estimator (EDE) Methods for Finding the Inflection Point of a
###   Convex/Concave Curve.
### Aliases: findiplist
### Keywords: inflection ese ede

### ** Examples

#Lets create some convex/concave data based on the Fisher-Pry model
#by using 1001 not equal spaced abscissas with data right asymmetry
N=1001;
#Case I: data without noise
set.seed(2017-05-11);x=sort(runif(N,0,15));y=5+5*tanh(x-5);
A=findiplist(x,y,0);A;
#      j1  j2      chi
# ESE 242 438 4.848448
# EDE 228 478 5.000907
plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,15));
abline(v=A[,3],col=c("blue","red"))
text(A[1,3]-0.5,0,expression(chi[S]),font=2);
text(A[2,3]+0.5,0,expression(chi[D]),font=2);
grid();
#
###Case II: noisy data
set.seed(2017-05-11);x=sort(runif(N,0,15));y=5+5*tanh(x-5)+rnorm(N,0,0.05);
A=findiplist(x,y,0);A;
#      j1  j2      chi
# ESE 245 437 4.853798
# EDE 245 469 5.030581
plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,15));
abline(v=A[,3],col=c("blue","red"))
text(A[1,3]-0.5,0,expression(chi[S]),font=2);
text(A[2,3]+0.5,0,expression(chi[D]),font=2);
grid();
#



