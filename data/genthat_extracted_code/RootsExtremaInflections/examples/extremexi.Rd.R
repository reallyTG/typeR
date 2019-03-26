library(RootsExtremaInflections)


### Name: extremexi
### Title: Function to Find the Extreme Point of a Planar Curve
### Aliases: extremexi
### Keywords: extremexi

### ** Examples

#Load data:
#
data(xydat)
#
#Extract x and y variables:
#
x=xydat$x;y=xydat$y
#
#Find extreme point, plot results, print Taylor coefficients and rho estimation:
#
c<-extremexi(x,y,1,length(x),5,5,plots=TRUE);c$an;c$fextr;
#
#Find multiple extrema.
#Let's create some data:
#
f=function(x){3*cos(x-5)};xa=0.;xb=9;
set.seed(12345);x=sort(runif(101,xa,xb));r=0.1;y=f(x)+2*r*(runif(length(x))-0.5);plot(x,y)
#
#The first extreme point is
c1<-extremexi(x,y,1,40,5,5,plots=TRUE);c1$an;c1$fextr;
#          2.5 %      97.5 %           an
# a0 -3.02708631 -2.94592364 -2.986504975
# a1  0.07660314  0.24706531  0.161834227
# a2  1.42127770  1.58580632  1.503542012
# a3 -0.09037154  0.10377241  0.006700434
# a4 -0.14788899 -0.08719428 -0.117541632
# a5 -0.03822416  0.01425066 -0.011986748
# [1] 22.000000  1.917229
#Compare it with the actual rho_1=1.858407346
#
#The second extreme point is
c2<-extremexi(x,y,50,80,5,5,plots=TRUE);c2$an;c2$fextr;
#          2.5 %       97.5 %         an
# a0  2.89779980  3.064703163  2.9812515
# a1  0.27288720  0.541496278  0.4071917
# a2 -1.81454401 -0.677932480 -1.2462382
# a3 -1.76290384  0.216201349 -0.7733512
# a4  0.02548354  1.269671304  0.6475774
# a5 -0.25156866  0.007565154 -0.1220018
# [1] 7.000000 4.896521
#You have to compare it with the actual value of rho_2=5.0
#
#Finally the third extreme point is
c3<-extremexi(x,y,80,length(x),5,5,plots=TRUE);c3$an;c3$fextr;
#         2.5 %     97.5 %         an
# a0 -3.0637461 -2.9218614 -2.9928037
# a1 -0.2381605  0.2615635  0.0117015
# a2  0.7860259  2.0105383  1.3982821
# a3 -1.4187417  0.7472155 -0.3357631
# a4 -0.7943208  1.0876143  0.1466468
# a5 -0.6677733  1.7628833  0.5475550
# [1] 11.000000  8.137392
#You have to compare it with the actual value of rho_3=8.141592654



