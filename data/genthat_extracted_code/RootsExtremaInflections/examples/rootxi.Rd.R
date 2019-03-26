library(RootsExtremaInflections)


### Name: rootxi
### Title: Function to Find the Root of a Planar Curve
### Aliases: rootxi
### Keywords: rootxi

### ** Examples

#Load data:
#
data(xydat)
#
#Extract x and y variables:
#
x=xydat$x;y=xydat$y
#
#Find root, plot results, print Taylor coefficients and rho estimation:
#
b<-rootxi(x,y,1,length(x),5,5,plots=TRUE);b$an;b$froot;
#
#Find multiple roots.
#Let's create some data:
#
f=function(x){3*cos(x-5)};xa=0.;xb=9;
set.seed(12345);x=sort(runif(101,xa,xb));r=0.1;y=f(x)+2*r*(runif(length(x))-0.5);plot(x,y)
#
#The first root is
#
b1<-rootxi(x,y,1,20,5,5,plots=TRUE);b1$an;b1$froot;
#          2.5 %      97.5 %          an
# a0 -0.09380972  0.03295954 -0.03042509
# a1 -3.63025679 -2.89908741 -3.26467210
# a2 -0.90435090  0.80658742 -0.04888174
# a3 -1.27911360  6.88168053  2.80128346
# a4 -8.77763032  2.51983279 -3.12889877
# a5 -1.10798564  3.38419904  1.13810670
# [1] 5.0000000 0.3108189
#Compare it with the actual rho_1=0.2876110196
#
#The second root is
#
b2<-rootxi(x,y,20,50,5,5,plots=TRUE);b2$an;b2$froot;
#         2.5 %     97.5 %           an
# a0  0.1483905  0.2377617  0.193076089
# a1  2.9024852  3.0936024  2.998043835
# a2 -0.2053120  0.2220390  0.008363525
# a3 -0.5845597 -0.3426017 -0.463580702
# a4 -0.2431038  0.1136244 -0.064739689
# a5 -0.0893246  0.0687848 -0.010269897
# [1] 19.000000  3.493296
#You have to compare it with the actual value of rho_2=3.429203673
#
#Finally the third root is
b3<-rootxi(x,y,50,90,5,5,plots=TRUE);b3$an;b3$froot;
#           2.5 %       97.5 %            an
# a0 -0.002269152  0.058784414  0.0282576308
# a1 -3.090980046 -2.938875341 -3.0149276930
# a2 -0.089893659  0.075094637 -0.0073995112
# a3  0.403040978  0.591836654  0.4974388159
# a4 -0.035442477  0.037165754  0.0008616385
# a5 -0.048414145  0.005815106 -0.0212995192
# [1] 23.000000  6.567948
#You have to compare it with the actual value of rho_3=6.570796327



