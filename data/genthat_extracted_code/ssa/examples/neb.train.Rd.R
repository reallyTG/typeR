library(ssa)


### Name: neb.train
### Title: Nonparametric empirical Bayes classifier without annotations;
###   training
### Aliases: neb.train

### ** Examples

p <- 1000; ## number of snps
I <- rep(0,p); I[1:10] <- 1; ## which snps are causal
set.seed(1); pi0 <- runif(p,0.1,0.5); ## control minor allele frequencies
set.seed(1); ors <- runif(sum(I),-1,1); ## odds ratios
pi1 <- pi0;
pi1[I==1] <- expit(ors+logit(pi0[I==1]));
## training data
n0 <- 100; ## number of controls
X0 <- t(replicate(n0,rbinom(p,2,pi0))); ## controls
n1 <- 50; ## number of cases
X1 <- t(replicate(n1,rbinom(p,2,pi1))); ## cases
neb <- neb.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,d=c(20,25));
contour(neb$Pi0,neb$Pi1,neb$g);
points(pi0,pi1);




