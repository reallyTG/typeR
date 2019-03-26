library(RootsExtremaInflections)


### Name: RootsExtremaInflections-package
### Title: Finds Roots, Extrema and Inflection Points of a Planar Curve
### Aliases: RootsExtremaInflections-package RootsExtremaInflections
### Keywords: rootxi extremexi inflexi

### ** Examples

#Load data:
data(xydat)
#
#Extract x and y variables:
x=xydat$x;y=xydat$y
#
#Find root, plot results, print Taylor coefficients and rho estimation:
b<-rootxi(x,y,1,length(x),5,5,plots=TRUE);b$an;b$froot;
#
#Find extreme, plot results, print Taylor coefficients and rho estimation:
c<-extremexi(x,y,1,length(x),5,5,plots=TRUE);c$an;c$fextr;
#
#Find inflection point, plot results, print Taylor coefficients and rho estimation:
d<-inflexi(x,y,1,length(x),5,5,plots=TRUE);d$an;d$finfl;
# Create a relative big data set...
f=function(x){3*cos(x-5)};xa=0.;xb=9;
set.seed(12345);x=sort(runif(5001,xa,xb));r=0.1;y=f(x)+2*r*(runif(length(x))-0.5);
#
#Find root, plot results, print Taylor coefficients and rho estimation in parallel:
#b1<-rootxi(x,y,1,round(length(x)/2),5,5,plots=TRUE,doparallel = TRUE);b1$an;b1$froot;
# Available workers are 12 
# Time difference of 5.838743 secs
#           2.5 %       97.5 %           an
# a0 -0.006960052  0.004414505 -0.001272774
# a1 -2.982715739 -2.933308292 -2.958012016
# a2 -0.308844145 -0.213011162 -0.260927654
# a3  0.806555336  0.874000586  0.840277961
# a4 -0.180720951 -0.161344935 -0.171032943
# a5  0.007140500  0.009083859  0.008112180
# [1] 177.0000000   0.2924279
# Compare with exact root = 0.2876110196
#Find extreme, plot results, print Taylor coefficients and rho estimation in parallel:
#c1<-extremexi(x,y,1,round(length(x)/2),5,5,plots=TRUE,doparallel = TRUE);c1$an;c1$fextr;
# Available workers are 12 
# Time difference of 5.822514 secs
#            2.5 %       97.5 %           an
# a0 -3.0032740050 -2.994123850 -2.998698927
# a1 -0.0006883998  0.012218393  0.005764997
# a2  1.4745326519  1.489836668  1.482184660
# a3 -0.0340626683 -0.025094859 -0.029578763
# a4 -0.1100798736 -0.105430525 -0.107755199
# a5  0.0071405003  0.009083859  0.008112180
# [1] 1022.000000    1.852496
# Compare with exact extreme = 1.858407346
#Find inflection point, plot results, print Taylor coefficients and rho estimation in parallel:
#d1<-inflexi(x,y,1090,2785,5,5,plots=TRUE,doparallel = TRUE);d1$an;d1$finfl;
# Available workers are 12 
# Time difference of 4.343851 secs
#           2.5 %       97.5 %            an
# a0 -0.008238016  0.002091071 -0.0030734725
# a1  2.995813560  3.023198534  3.0095060468
# a2 -0.014591465  0.015326175  0.0003673549
# a3 -0.531029710 -0.484131902 -0.5075808056
# a4 -0.008253975  0.007556465 -0.0003487551
# a5  0.016126428  0.034688019  0.0254072236
# [1] 800.000000   3.427705
# Compare with exact inflection = 3.429203673
# Or execute rootexinf() and find a set of them at once and in same time:
#a<-rootexinf(x,y,100,round(length(x)/2),5,plots = TRUE,doparallel = TRUE);
#a$an0;a$an1;a$an2;a$frexinf;
# Available workers are 12 
# Time difference of 5.565372 secs
#           2.5 %      97.5 %           an0
# a0 -0.008244278  0.00836885  6.228596e-05
# a1 -2.927764078 -2.84035634 -2.884060e+00
# a2 -0.447136449 -0.30473094 -3.759337e-01
# a3  0.857290490  0.94794071  9.026156e-01
# a4 -0.198104383 -0.17360676 -1.858556e-01
# a5  0.008239609  0.01059792  9.418764e-03
#           2.5 %      97.5 %          an1
# a0 -3.005668018 -2.99623116 -3.000949590
# a1 -0.003173501  0.00991921  0.003372854
# a2  1.482600580  1.50077450  1.491687542
# a3 -0.034503271 -0.02551597 -0.030009618
# a4 -0.115396537 -0.10894117 -0.112168855
# a5  0.008239609  0.01059792  0.009418764
#           2.5 %       97.5 %          an2
# a0  0.083429390  0.092578772  0.088004081
# a1  3.007115452  3.027343849  3.017229650
# a2 -0.009867779  0.006590042 -0.001638868
# a3 -0.517993955 -0.497886933 -0.507940444
# a4 -0.043096158 -0.029788902 -0.036442530
# a5  0.008239609  0.010597918  0.009418764
#            index     value
# root          74 0.2878164
# extreme      923 1.8524956
# inflection  1803 3.4604842
#Here a first plot always is helpful.



