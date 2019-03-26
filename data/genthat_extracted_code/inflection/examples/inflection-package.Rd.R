library(inflection)


### Name: inflection-package
### Title: Finds the Inflection Point of a Curve
### Aliases: inflection-package inflection
### Keywords: inflection

### ** Examples

#
#Lets create some convex/concave data based on the Fisher-Pry model
#by using 1001 not equal spaced abscissas with data right asymmetry
N=20001;
#Case I: not noisy data
#
set.seed(2017-05-11);x=sort(runif(N,0,15));y=5+5*tanh(x-5);
#
#t1=Sys.time();
#tese=ese(x,y,0,doparallel = TRUE);#...simple run of ESE
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 8.833521 secs
#tese;
#       j1   j2      chi
# ESE 4686 8353 4.835303
tede=ede(x,y,0);tede;#...simple run of EDE
#       j1   j2      chi
# EDE 4506 8937 4.999854
edeci(x,y,0);#...Run EDE and compute 95% Chebyshev c.i.
#       j1   j2      chi k  chi-5*s  chi+5*s
# EDE 4506 8937 4.999854 5 4.994231 5.005477
#
#t1=Sys.time();
#eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 10.00725 secs
#eseit$iplast#...last estimation for inflection point
# [1] 5.000004
#eseit$iters#...all iterations done...
#        n            a         b      ESE
# 1  20001 0.0001931784 14.999900 4.835303
# 2   3668 4.4606627093  5.647031 5.053847
# 3   1567 4.6878642635  5.262619 4.975242
# 4    737 4.8696049280  5.154673 5.012139
# 5    376 4.9229470803  5.064312 4.993629
# 6    181 4.9684872106  5.038649 5.003568
# 7     82 4.9806225684  5.015416 4.998019
# 8     35 4.9924177257  5.009629 5.001023
# 9     20 4.9960624950  5.002740 4.999401
# 10    11 4.9980399851  5.001968 5.000004
#
t1=Sys.time();
edeit=bede(x,y,0);#...Bisection EDE (BEDE)
t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 0.073102 secs
edeit$iplast#...last estimation for inflection point
# [1] 4.999459
edeit$iters#...all iterations done
#        n            a         b      EDE
# 1  20001 0.0001931784 14.999900 4.999854
# 2   4432 4.1998532682  5.799711 4.999782
# 3   2107 4.5637933596  5.437583 5.000688
# 4   1144 4.7517725313  5.247734 4.999753
# 5    644 4.8571156547  5.141445 4.999280
# 6    371 4.9186601420  5.081275 4.999968
# 7    209 4.9537387909  5.046274 5.000006
# 8    109 4.9746007437  5.026189 5.000395
# 9     58 4.9847909727  5.014909 4.999850
# 10    31 4.9906087574  5.008346 4.999477
# 11    20 4.9941347516  5.005834 4.999984
# 12    13 4.9962181749  5.002740 4.999479
# 13    10 4.9980399851  5.001968 5.000004
# 14     5 4.9980399851  5.001157 4.999599
# 15     4 4.9980399851  5.000878 4.999459
#t1=Sys.time();
#A=findiplist(x,y,0,doparallel=TRUE);#...Run both ESE & EDE at once...
#t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 8.069601 secs
#A;
#       j1   j2      chi
# ESE 4686 8353 4.835303
# EDE 4506 8937 4.999854
#Let's plot some interesting approximately results.
# plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,x[N]));
# lines(c(x[1],x[A[1,2]]),c(y[1],y[A[1,2]]),col="green",lty=2);
# lines(c(x[N],x[A[1,1]]),c(y[N],y[A[1,1]]),col="blue",lty=2);
# lines(c(x[1],x[N]),c(y[1],y[N]),col="black",lty=2);
# abline(v=A[,3],col=c('blue','red'),lty=2);
# points(x[A[1,1:2]],y[A[1,1:2]], type = "p",pch = 19,col="blue",font=2);
# points(x[A[2,1:2]],y[A[2,1:2]], type = "p",pch = 19,col="red",font=2);
# text(A[1,3]-0.5,0,expression(chi[S]),font=2,col='blue');
# text(A[2,3]+0.5,0,expression(chi[D]),font=2,col='red');
# grid();
#
###Case II: noisy data
#
set.seed(2017-05-11);x=sort(runif(N,0,15));
r=0.1;y=5+5*tanh(x-5)+rnorm(N,0,0.05);
#
# t1=Sys.time();
# tese=ese(x,y,0,doparallel = TRUE);#...simple run of ESE
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 7.692794 secs
#tese;
#       j1   j2     chi
# ESE 4496 8470 4.82379
tede=ede(x,y,0);tede;#...simple run of EDE
#       j1   j2      chi
# EDE 4496 8737 4.920319
edeci(x,y,0);#...Run EDE and compute 95% Chebyshev c.i.
#       j1   j2      chi k  chi-5*s  chi+5*s
# EDE 4496 8737 4.920319 5 4.670757 5.169881
# t1=Sys.time();
# eseit=bese(x,y,0,doparallel = TRUE);#...Bisection ESE (BESE)
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 9.069703 secs
#eseit$iplast#...last estimation for inflection point
# [1] 4.939637
#eseit$iters#...all iterations done...
#       n            a         b      ESE
# 1 20001 0.0001931784 14.999900 4.823790
# 2  3975 4.4058744342  5.714312 5.060093
# 3  1734 4.6071795677  5.190929 4.899054
# 4   742 4.8696448782  5.009629 4.939637
#
t1=Sys.time();
edeit=bede(x,y,0);#...Bisection EDE (BEDE)
t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
#Time difference of Time difference of 0.01562595 secs
edeit$iplast#...last estimation for inflection point
# [1] 4.94808
edeit$iters#...all iterations done
#       n            a         b      EDE
# 1 20001 0.0001931784 14.999900 4.920319
# 2  4242 4.1818478820  5.714312 4.948080
#
# t1=Sys.time();
# A=findiplist(x,y,0,doparallel=TRUE);#...Run both ESE & EDE at once...
# t2=Sys.time();print(as.POSIXlt(t2, "GMT")-as.POSIXlt(t1, "GMT"),quote=F);
# Time difference of 7.912064 secs
#A;
#       j1   j2      chi
# ESE 4496 8470 4.823790
# EDE 4496 8737 4.920319
#
#Let's plot some interesting approximately results.
# plot(x,y,type="l",xaxt="n",lwd=2);axis(1,at=seq(0,x[N]));
# lines(c(x[1],x[A[1,2]]),c(y[1],y[A[1,2]]),col="green",lty=2);
# lines(c(x[N],x[A[1,1]]),c(y[N],y[A[1,1]]),col="blue",lty=2);
# lines(c(x[1],x[N]),c(y[1],y[N]),col="black",lty=2);
# abline(v=A[,3],col=c('blue','red'),lty=2);
# points(x[A[1,1:2]],y[A[1,1:2]], type = "p",pch = 19,col="blue",font=2);
# points(x[A[2,1:2]],y[A[2,1:2]], type = "p",pch = 19,col="red",font=2);
# text(A[1,3]-0.5,0,expression(chi[S]),font=2,col='blue');
# text(A[2,3]+0.5,0,expression(chi[D]),font=2,col='red');
# grid();
#Close device
#dev.off();
#



