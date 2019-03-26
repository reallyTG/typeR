library(inflection)


### Name: bede
### Title: Bisection Extremum Distance Estimator Method
### Aliases: bede
### Keywords: bede iterative bisection

### ** Examples

#
#Fisher-pry model with heavy noise, unequal spaces
#and 1 million cases:
N=10^6+1;
set.seed(2017-05-11);x=sort(runif(N,0,10));y=5+5*tanh(x-5)+runif(N,-1,1);
#
ptm <- proc.time()
tede=ede(x,y,0);tede;proc.time() - ptm
#         j1     j2      chi
# EDE 351061 648080 4.997139
# user  system elapsed 
# 0.02    0.02    0.05 
#



