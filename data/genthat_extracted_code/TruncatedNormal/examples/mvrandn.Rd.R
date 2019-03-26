library(TruncatedNormal)


### Name: mvrandn
### Title: truncated multivariate normal generator
### Aliases: mvrandn
### Keywords: truncated normal gaussian generator perfect sampling

### ** Examples

# Bivariate example.

Sig=matrix(c(1,0.9,0.9,1),2,2);mu=c(-3,0);l=c(-Inf,-Inf);u=c(-6,Inf);A=matrix(c(1,0,-1,1),2,2);
 n=10^3; # number of sampled vectors
 Y=mvrandn(l-A%*%mu,u-A%*%mu,A%*%Sig%*%t(A),n); 
 X=rep(mu,n)+solve(A,diag(2))%*%Y; # now apply the inverse map as explained above
 plot(X[1,],X[2,]) # provide a scatterplot of exactly simulated points

# Exact Bayesian Posterior Simulation Example.

data("lupus"); # load lupus data
Y = lupus[,1]; # response data
X = lupus[,-1]  # construct design matrix
m=dim(X)[1]; d=dim(X)[2]; # dimensions of problem
X=diag(2*Y-1)%*%X; # incorporate response into design matrix
nu=sqrt(10000); # prior scale parameter
C=solve(diag(d)/nu^2+t(X)%*%X);
L=t(chol(t(C))); # lower Cholesky decomposition
Sig=diag(m)+nu^2*X%*%t(X); # this is covariance of Z given beta
l=rep(0,m);u=rep(Inf,m);
est=mvNcdf(l,u,Sig,10^3); # estimate acceptance probability of Crude Monte Carlo
print(est$upbnd/est$prob) # estimate the reciprocal of acceptance probability
n=10^4 # number of iid variables
z=mvrandn(l,u,Sig,n); # sample exactly from auxiliary distribution 
beta=L%*%matrix(rnorm(d*n),d,n)+C%*%t(X)%*%z; # simulate beta given Z and plot boxplots of marginals
boxplot(t(beta)) # plot the boxplots of the marginal distribution of the coefficients in beta
print(rowMeans(beta)) # output the posterior means



