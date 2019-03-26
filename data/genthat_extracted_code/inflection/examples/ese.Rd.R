library(inflection)


### Name: ese
### Title: The Extremum Surface Estimator (ESE) for Finding the Inflection
###   Point of a Convex/Concave Curve
### Aliases: ese
### Keywords: ese

### ** Examples

#
#
#Fisher-pry model with heavy noise and unequal spaces, relative large data set:
#N=20001;
#set.seed(2017-05-11);x=sort(runif(N,0,10));y=5+5*tanh(x-5)+runif(N,-1,1);
#plot(x,y,type='l',ylab=expression(5+5*tanh(x-5)+epsilon[i]))
#
#t1=Sys.time();
#tese=ese(x,y,0,doparallel = TRUE);
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
#Time difference of 7.641404 secs
#tese;abline(v=tese[3],col='blue')
#       j1    j2      chi
# ESE 7559 12790 5.078434
#Compare with serial version (don't run):
#
# t1=Sys.time();
# tese=ese(x,y,0,doparallel = FALSE);
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# #Time difference of 24.24364 secs
# tese;
#      j1    j2      chi
# ESE 7559 12790 5.078434
#



