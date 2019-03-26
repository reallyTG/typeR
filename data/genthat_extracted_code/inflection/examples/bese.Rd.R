library(inflection)


### Name: bese
### Title: Bisection Extremum Surface Estimator Method
### Aliases: bese
### Keywords: bese iterative bisection

### ** Examples

#Fisher-pry model with noise and 50k cases:
N=5*10^4+1;
set.seed(2017-05-11);x=seq(0,15,length.out = N);y=5+5*tanh(x-5)+runif(N,-0.25,0.25);
#We first run BEDE to find a smaller neighborhood for inflection point
iters=bede(x,y,0)$iters;
iters;
#Now we find last interval
ab=apply(iters[dim(iters)[1],c('a','b')],2,function(xx,x){which(x==xx)},x);ab;
#Apply BESE to that
eseit=bese(x[ab[1]:ab[2]],y[ab[1]:ab[2]],0)
eseit$iplast
eseit$iters
#Or apply directly to data with doparallel=TRUE
#
#t1=Sys.time();
#eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 56.14608 secs
#eseit$iplast#...last estimation for inflection point
# [1] 5.0241
#eseit$iters#...all iterations done...
#       n      a       b     ESE
# 1 50001 0.0000 15.0000 4.81740
# 2  9375 4.4721  5.6505 5.06130
# 3  3929 4.7007  5.2758 4.98825
# 4  1918 4.8654  5.1828 5.02410
#Better accuracy, slightly more time, provided that there exist multi cores.
#plot(eseit$iters$ESE,type='b');abline(h=5,col='blue',lwd=3)
#



