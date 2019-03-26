library(inflection)


### Name: edeci
### Title: An Improved Version of EDE that Provides Us with a Chebyshev
###   Confidence Interval for Inflection Point
### Aliases: edeci
### Keywords: edeci

### ** Examples

#
#Gompertz model with noise, unequal spaces
#and 1 million cases:
N=10^6+1;
set.seed(2017-05-11);x=sort(runif(N,0,10));y=10*exp(-exp(5)*exp(-x))+runif(N,-0.05,0.05);
#EDE one time only
ede(x,y,0)
#         j1     j2      chi
# EDE 372064 720616 5.465584
#Not so close to the exact point
#Let's reduce the size using BEDE
iters=bede(x,y,0)$iters;iters;
#         n            a        b      EDE
# 1 1000001 2.273591e-05 9.999994 5.465584
# 2  348553 4.237734e+00 6.017385 5.127559
# 3  177899 4.573986e+00 5.499655 5.036821
#Now we choose last interval, in order for EDE to be applicable on next run
ab=apply(iters[dim(iters)[1]-1,c('a','b')],2,function(xx,x){which(x==xx)},x);ab;
#      a      b 
# 423480 601378
#Apply edeci...
edeci(x[ab[1]:ab[2]],y[ab[1]:ab[2]],0)
#        j1     j2      chi k  chi-5*s  chi+5*s
# EDE 33355 126329 5.036821 5 4.892156 5.181485
#Very close to the true inflection point.
#



