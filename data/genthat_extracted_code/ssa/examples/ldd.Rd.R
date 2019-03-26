library(ssa)


### Name: ldd
### Title: Latent dependency detection
### Aliases: ldd

### ** Examples

## generate paired test statistics
## No test: 
p <- 10^6; ## total number of pairs
X <- c(rep(0,p-30),rep(1,10),rep(2,10),rep(3,10));
## X=0: no signal in either sequence of tests
## X=1: signal in sequence 1 only
## X=2: signal in sequence 2 only
## X=3: simultaneous signal
set.seed(1);
Z1 <- rnorm(p,0,1); Z1[X==1|X==3] <- rnorm(20,3,1);
Z2 <- rnorm(p,0,1); Z2[X==2|X==3] <- rnorm(20,4,1);
## convert to p-value
P1 <- 2*pnorm(-abs(Z1));
P2 <- 2*pnorm(-abs(Z2));
## run different version of ldd()
out.pp <- ldd(P1,P2,perm=100);
out.zp <- ldd(abs(Z1),P2,p1=FALSE,perm=100);
out.pz <- ldd(P1,abs(Z2),p2=FALSE,perm=100);
out.zz <- ldd(abs(Z1),abs(Z2),p1=FALSE,p2=FALSE,perm=100);
## End(No test)




