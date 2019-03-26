library(mvMORPH)


### Name: mvgls
### Title: Fit linear model using Generalized Least Squares to multivariate
###   (high-dimensional) data sets.
### Aliases: mvgls
### Keywords: GIC GLS Regularization Penalized likelihood Multivariate
###   Linear Models High dimensions

### ** Examples

## No test: 
set.seed(1)
n <- 32 # number of species
p <- 50 # number of traits (p>n)

tree <- pbtree(n=n, scale=1) # phylogenetic tree
R <- crossprod(matrix(rnorm(p*p), ncol=p)) # a random covariance matrix
# simulate a BM dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R, theta=rep(0,p))) 
data=list(Y=Y)

fit1 <- mvgls(Y~1, data=data, tree, model="BM", penalty="RidgeArch")
fit2 <- mvgls(Y~1, data=data, tree, model="OU", penalty="RidgeArch")
fit3 <- mvgls(Y~1, data=data, tree, model="EB", penalty="RidgeArch")

GIC(fit1); GIC(fit2); GIC(fit3) # BM have the lowest GIC value



# A High-dimensional dataset
p <- 200 # number of traits (p>n)

R <- crossprod(matrix(rnorm(p*p), ncol=p)) # a random symmetric matrix (covariance)
# simulate a BM dataset
Y <- mvSIM(tree, model="BM1", nsim=1, param=list(sigma=R, theta=rep(0,p))) 
data=list(Y=Y)

# Fast LOOCV using "H&L" with RidgeArch penalization
summary(mvgls(Y~1, data=data, tree, model="BM", penalty="RidgeArch", method="H&L"))

## End(No test)




