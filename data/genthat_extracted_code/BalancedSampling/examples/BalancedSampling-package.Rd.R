library(BalancedSampling)


### Name: BalancedSampling-package
### Title: Balanced and Spatially Balanced Sampling
### Aliases: BalancedSampling-package BalancedSampling
### Keywords: sampling

### ** Examples

# *********************************************************
# check inclusion probabilities
# *********************************************************
set.seed(1234567);
p = c(0.2, 0.25, 0.35, 0.4, 0.5, 0.5, 0.55, 0.65, 0.7, 0.9);
N = length(p);
X = cbind(runif(N),runif(N));
p1 = p2 = p3 = p4 = rep(0,N);
nrs = 1000; # increase for more precision 
for(i in 1:nrs){
  # lpm1
  s = lpm1(p,X);
  p1[s]=p1[s]+1;
  
  # lpm2
  s = lpm2(p,X);
  p2[s]=p2[s]+1;
  
  # scps
  s = scps(p,X);
  p3[s]=p3[s]+1;
  
  # lcube
  s = lcube(p,X,cbind(p));
  p4[s]=p4[s]+1; 
}
print(p);
print(p1/nrs);
print(p2/nrs);
print(p3/nrs);
print(p4/nrs);

# *********************************************************
# check spatial balance
# *********************************************************
set.seed(1234567);
N = 500;
n = 70;
p = rep(n/N,N);
X = cbind(runif(N),runif(N));
nrs = 10; # increase for more precision 
b1 = b2 = b3 = b4 = b5 = rep(0,nrs);

for(i in 1:nrs){
  # lpm1
  s = lpm1(p,X);
  b1[i] = sb(p,X,s);
  
  # lpm2
  s = lpm2(p,X);
  b2[i] = sb(p,X,s);
  
  # scps
  s = scps(p,X);
  b3[i] = sb(p,X,s);
  
  # lcube
  s = lcube(p,X,cbind(p));
  b4[i] = sb(p,X,s);  
  
  # srs
  s = sample(N,n);
  b5[i] = sb(p,X,s);
}
print(mean(b1));
print(mean(b2));
print(mean(b3));
print(mean(b4));
print(mean(b5));

# *********************************************************
# stratification
# *********************************************************
set.seed(1234567);
N = 10;
n = 4;
p = rep(n/N,N);
stratum1 = c(1,1,1,1,1,0,0,0,0,0); # stratum 1 indicator
stratum2 = c(0,0,0,0,0,1,1,1,1,1); # stratum 2 indicator
stratum3 = c(0,0,1,1,1,1,1,0,0,0); # overlapping 1 and 2
s = lpm1(p,cbind(stratum1,stratum2,stratum3));

# *********************************************************
# plot spatially balanced sample
# *********************************************************
set.seed(1234567);
N = 1000; # population size
n = 100; # sample size
p = rep(n/N,N); # inclusion probabilities
X = cbind(runif(N),runif(N)); # matrix of auxiliary variables
s = lpm1(p,X); # select sample 
plot(X[,1],X[,2]); # plot population
points(X[s,1],X[s,2], pch=19); # plot sample

# *********************************************************
# check cpu time (for simulation)
# *********************************************************
set.seed(1234567);
N = 2000;
n = 100;
X = cbind(runif(N),runif(N));
p = rep(n/N,N);
system.time(for(i in 1:10){lpm1(p,X)});
system.time(for(i in 1:10){lpm2(p,X)});




