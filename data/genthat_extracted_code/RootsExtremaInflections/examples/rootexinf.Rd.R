library(RootsExtremaInflections)


### Name: rootexinf
### Title: Function to Find the Root, Extreme and Inflection of a Planar
###   Curve
### Aliases: rootexinf
### Keywords: rootexinf

### ** Examples

#Load data:
#Let's create some data:
f=function(x){3*cos(x-5)+1.5};xa=1.;xb=5;
set.seed(12345);x=sort(runif(5001,xa,xb));
r=0.1;y=f(x)+2*r*(runif(length(x))-0.5);plot(x,y);abline(h=0)
#a<-rootexinf(x,y,1,length(x),5,plotpdf = TRUE,doparallel = TRUE);a$an0;a$an1;a$an2;a$frexinf;
# Available workers are 12 
# Time difference of 13.02153 secs
# File 'root_extreme_inflection_plot.pdf' has been created 
#           2.5 %       97.5 %          an0
# a0 -0.004165735  0.001838624 -0.001163555
# a1  2.588990973  2.600915136  2.594953055
# a2  0.731456294  0.741262772  0.736359533
# a3 -0.435591038 -0.423837041 -0.429714040
# a4 -0.052926049 -0.050039975 -0.051483012
# a5  0.017915715  0.020538155  0.019226935
#           2.5 %       97.5 %           an1
# a0 -1.507117843 -1.500375848 -1.5037468451
# a1 -0.008343275  0.007916087 -0.0002135941
# a2  1.519432687  1.534103788  1.5267682378
# a3 -0.017663080  0.007780728 -0.0049411760
# a4 -0.159461025 -0.144303367 -0.1518821962
# a5  0.017915715  0.020538155  0.0192269354
#           2.5 %       97.5 %           an2
# a0  1.503394727  1.509925166  1.5066599466
# a1  2.985374546  2.995259021  2.9903167834
# a2 -0.009041165  0.005898692 -0.0015712367
# a3 -0.489107253 -0.480579585 -0.4848434187
# a4 -0.003885327  0.002364758 -0.0007602842
# a5  0.017915715  0.020538155  0.0192269354
# index    value
# root        2364 2.903791
# extreme     1057 1.859431
# inflection  3038 3.431413
# You have to compare with the exact values
# root=2.905604898
# extreme=1.858407346
# inflection=3.429203673



