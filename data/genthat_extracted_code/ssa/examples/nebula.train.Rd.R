library(ssa)


### Name: nebula.train
### Title: Nonparametric empirical Bayes classifier using latent
###   annotations: wrapper function; training
### Aliases: nebula.train

### ** Examples

p <- 1000; ## number of snps
I <- rep(0,p); I[1:10] <- 1; ## which snps are causal
set.seed(1); pi0 <- runif(p,0.1,0.5); ## control minor allele frequencies
set.seed(1); ors <- runif(sum(I),-1,1); ## odds ratios
pi1 <- pi0;
pi1[I==1] <- expit(ors+logit(pi0[I==1]));
set.seed(1); lam <- rep(0,p); lam[I==1] <- rchisq(sum(I==1),1,50); ## ncps
## training data
n0 <- 100; ## number of controls
X0 <- t(replicate(n0,rbinom(p,2,pi0))); ## controls
n1 <- 50; ## number of cases
X1 <- t(replicate(n1,rbinom(p,2,pi1))); ## cases
T <- rchisq(p,1,lam); ## chi-square statistics
nebula1 <- nebula.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,d=c(10,15));
nebula2 <- nebula.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,T=T,d=c(10,15,20));
nebula3 <- nebula.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,I=I,d=c(10,15));
nebula4 <- nebula.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,T=T,I=I,d=c(10,15,20));




