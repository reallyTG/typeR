library(ssa)


### Name: nfsdr2
### Title: Nonparametric false simultaneous discovery rate control, two
###   thresholds
### Aliases: nfsdr2

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
## convert to p-value
P1 <- 2*pnorm(-abs(Z1));
P2 <- 2*pnorm(-abs(Z2));
## run different version of fsdr()
out.pp <- fsdr(P1,P2,alpha=0.05);
out.zp <- fsdr(abs(Z1),P2,p1=FALSE,alpha=0.05);
out.pz <- fsdr(P1,abs(Z2),p2=FALSE,alpha=0.05);
out.zz <- fsdr(abs(Z1),abs(Z2),p1=FALSE,p2=FALSE,alpha=0.05);
## discovered simultaneous features
R1 <- which(P1<=out.pp[1]&P2<=out.pp[2]);
R2 <- which(abs(Z1)>=out.zp[1]&P2<=out.zp[2]);
R3 <- which(P1<=out.pz[1]&abs(Z2)>=out.pz[2]);
R4 <- which(abs(Z1)>=out.zz[1]&abs(Z2)>=out.zz[2]);
## End(No test)




