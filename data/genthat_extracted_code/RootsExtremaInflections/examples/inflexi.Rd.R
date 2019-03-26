library(RootsExtremaInflections)


### Name: inflexi
### Title: Function to Find the Inflection Point of a Planar Curve
### Aliases: inflexi
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
#Find inflection point, plot results, print Taylor coefficients and rho estimation:
#
d<-inflexi(x,y,1,length(x),5,5,plots=TRUE);d$an;d$finfl;
#
#Find multiple inflection points.
#Let's create some data:
#
f=function(x){3*cos(x-5)};xa=0.;xb=9;
set.seed(12345);x=sort(runif(101,xa,xb));r=0.1;y=f(x)+2*r*(runif(length(x))-0.5);plot(x,y)
#
#The first inflection point is
d1<-inflexi(x,y,20,50,5,5,plots=TRUE);d1$an;d1$finfl;
#         2.5 %     97.5 %           an
# a0  0.1483905  0.2377617  0.193076089
# a1  2.9024852  3.0936024  2.998043835
# a2 -0.2053120  0.2220390  0.008363525
# a3 -0.5845597 -0.3426017 -0.463580702
# a4 -0.2431038  0.1136244 -0.064739689
# a5 -0.0893246  0.0687848 -0.010269897
# [1] 19.000000  3.493296
#Compare it with the actual rho_1=3.429203673
#
#The second inflection point is
# d2<-inflexi(x,y,50,length(x),5,5,plots=TRUE);d2$an;d2$finfl;
#           2.5 %       97.5 %            an
# a0 -0.000875677  0.057156356  0.0281403394
# a1 -3.058363342 -2.942026810 -3.0001950762
# a2 -0.056224101  0.044135857 -0.0060441222
# a3  0.433135897  0.528446241  0.4807910691
# a4 -0.011774733  0.012002414  0.0001138404
# a5 -0.026899286 -0.009520899 -0.0182100925
# [1] 23.000000  6.567948
#You have to compare it with the actual value of rho_2=6.570796327



