library(ssa)


### Name: nfsdr
### Title: Nonparametric false simultaneous discovery rate control
### Aliases: nfsdr

### ** Examples

## No test: 
## generate paired test statistics
p <- 10^6; ## total number of pairs
X <- c(rep(0,p-30),rep(1,10),rep(2,10),rep(3,10));
## X=0: no signal in either sequence of tests
## X=1: signal in sequence 1 only
## X=2: signal in sequence 2 only
## X=3: simultaneous signal
set.seed(1);
Z1 <- rnorm(p,0,1); Z1[X==1|X==3] <- rnorm(20,3,1);
Z2 <- rnorm(p,0,1); Z2[X==2|X==3] <- rnorm(20,4,1);
T <- cbind(Z1^2, Z2^2);
## rejected simultaneous signals
nfsdr(T, 0.05)
## End(No test)




