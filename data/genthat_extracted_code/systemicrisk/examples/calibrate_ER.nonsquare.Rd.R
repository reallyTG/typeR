library(systemicrisk)


### Name: calibrate_ER.nonsquare
### Title: Calibrate ER model to a given density with a nonsquare matrix
### Aliases: calibrate_ER.nonsquare

### ** Examples

## first generate a true network
nrow <- 10 # size of network
ncol <- 8 # size of network
p <- 0.45
lambda <- 0.1
L <- matrix(nrow=nrow,rbinom(nrow*ncol,prob=p,size=1)*rexp(nrow*ncol,rate=lambda))

# then reconstruct with a target density of 0.55
model <- calibrate_ER.nonsquare(l=rowSums(L),a=colSums(L),
                      targetdensity=0.55,nsamples_calib=10)
Lsamp <- sample_HierarchicalModel(l=rowSums(L),a=colSums(L),model=model,
                                    nsamples=10,thin=1e2)
# check row sums
rowSums(L)
rowSums(Lsamp$L[[10]])
# check calibration
mean(Lsamp$L[[10]]>0)

# now an example with some fixed entries
L_fixed <- L
L_fixed[1:(nrow/2),] <- NA
# then reconstruct with a target density of 0.9
model <- calibrate_ER.nonsquare(l=rowSums(L),a=colSums(L),L_fixed=L_fixed,
                              targetdensity=0.9,nsamples_calib=10)
Lsamp <- sample_HierarchicalModel(l=rowSums(L),a=colSums(L),L_fixed=L_fixed,
                                  model=model,nsamples=10,thin=1e2)
mean(Lsamp$L[[10]][-(1:(nrow/2)),]>0) # known entries
mean(Lsamp$L[[10]][(1:(nrow/2)),]>0)  #reconstructed entries



