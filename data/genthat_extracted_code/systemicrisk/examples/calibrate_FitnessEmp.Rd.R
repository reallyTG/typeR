library(systemicrisk)


### Name: calibrate_FitnessEmp
### Title: Calibrate empirical fitness model to a given density
### Aliases: calibrate_FitnessEmp

### ** Examples

## first generate a true network
n <- 10 # size of network
ftrue <- rnorm(n) # vector of underlying fitnesses
p <- outer(ftrue,ftrue,FUN=function(x,y) 1/(1+exp(-(x+y))))
lambda <- 0.1
L <- matrix(nrow=n,rbinom(n*n,prob=p,size=1)*rexp(n*n,rate=lambda))

# then reconstruct with a target density of 0.7
model <- calibrate_FitnessEmp(l=rowSums(L),a=colSums(L),
                              targetdensity=0.7,nsamples_calib=10,thin_calib=50)
Lsamp <- sample_HierarchicalModel(l=rowSums(L),a=colSums(L),model=model,
                                    nsamples=10,thin=1e2)
# check row sums
rowSums(L)
rowSums(Lsamp$L[[10]])
# check calibration
mean(Lsamp$L[[10]]>0)

# now an example with some fixed entries
L_fixed <- L
L_fixed[1:(n/2),] <- NA
# then reconstruct with a target density of 0.9
model <- calibrate_FitnessEmp(l=rowSums(L),a=colSums(L),L_fixed=L_fixed,
                              targetdensity=0.9,nsamples_calib=10,thin_calib=50)
Lsamp <- sample_HierarchicalModel(l=rowSums(L),a=colSums(L),L_fixed=L_fixed,
                                  model=model,nsamples=10,thin=1e2)
mean(Lsamp$L[[10]][-(1:(n/2)),]>0) # known entries
mean(Lsamp$L[[10]][(1:(n/2)),]>0)  #reconstructed entries



