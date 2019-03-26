library(ssa)


### Name: nebula.chisq.train
### Title: Nonparametric empirical Bayes classifier using latent
###   annotations: chi-square test statistics; training
### Aliases: nebula.chisq.train

### ** Examples

p <- 1000; ## number of snps
I <- rep(0,p); I[1:10] <- 1; ## which snps are causal
set.seed(1); pi0 <- runif(p,0.1,0.5); ## control minor allele frequencies
set.seed(1); ors <- runif(sum(I),-1,1); ## odds ratios
pi1 <- pi0;
pi1[I==1] <- expit(ors+logit(pi0[I==1]));
set.seed(1); lam <- rep(0,p); lam[I==1] <- rchisq(sum(I==1),1,25); ## ncps
## training data
n0 <- 100; ## number of controls
X0 <- t(replicate(n0,rbinom(p,2,pi0))); ## controls
n1 <- 50; ## number of cases
X1 <- t(replicate(n1,rbinom(p,2,pi1))); ## cases
T <- rchisq(p,1,lam); ## chi-square statistics
nebula <- nebula.chisq.train(colMeans(X0)/2,colMeans(X1)/2,n0,n1,T,d=c(20,25,30));
par(mfrow=c(1,3));
contour(nebula$Pi0,nebula$Pi1,apply(nebula$g,c(1,2),sum));
points(pi0,pi1);
contour(nebula$Pi0,nebula$Lam,apply(nebula$g,c(1,3),sum));
points(pi0,lam);
contour(nebula$Pi1,nebula$Lam,apply(nebula$g,c(2,3),sum));
points(pi1,lam);




