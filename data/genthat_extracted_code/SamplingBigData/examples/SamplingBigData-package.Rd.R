library(SamplingBigData)


### Name: SamplingBigData-package
### Title: Sampling Methods for Big Data
### Aliases: SamplingBigData-package SamplingBigData
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
for(i in seq(nrs) ){

  # lpm2 kdtree
  s = lpm2_kdtree(p,X);
  p1[s]=p1[s]+1;
  
  # pivotal method 
  s = split_sample(p);
  p2[s]=p2[s]+1;
  
}
print(p);
print(p1/nrs);
print(p2/nrs);



