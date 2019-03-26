library(GenOrd)


### Name: ordsample
### Title: Drawing a sample of discrete data
### Aliases: ordsample
### Keywords: htest models multivariate distribution datagen

### ** Examples

# Example 1

# draw a sample from a bivariate ordinal variable
# with 4 of categories and asymmetrical marginal distributions
# and correlation coefficient 0.6 (to be checked)
k <- 2
marginal <- list(c(0.1,0.3,0.6), c(0.4,0.7,0.9))
corrcheck(marginal) # check ok
Sigma <- matrix(c(1,0.6,0.6,1),2,2)
# sample size 1000
n <- 1000
# generate a sample of size n
m <- ordsample(n, marginal, Sigma)
head(m)
# sample correlation matrix
cor(m) # compare it with Sigma
# empirical marginal distributions
cumsum(table(m[,1]))/n
cumsum(table(m[,2]))/n # compare them with the two marginal distributions

# Example 1bis

# draw a sample from a bivariate ordinal variable
# with 4 of categories and asymmetrical marginal distributions
# and Spearman correlation coefficient 0.6 (to be checked)
k <- 2
marginal <- list(c(0.1,0.3,0.6), c(0.4,0.7,0.9))
corrcheck(marginal, Spearman=TRUE) # check ok
Sigma <- matrix(c(1,0.6,0.6,1),2,2)
# sample size 1000
n <- 1000
# generate a sample of size n
m <- ordsample(n, marginal, Sigma, Spearman=TRUE)
head(m)
# sample correlation matrix
cor(rank(m[,1]),rank(m[,2])) # compare it with Sigma
# empirical marginal distributions
cumsum(table(m[,1]))/n
cumsum(table(m[,2]))/n # compare them with the two marginal distributions

# Example 1ter

# draw a sample from a bivariate random variable
# with binomial marginal distributions (n=3, p=1/3 and n=4, p=2/3)
# and Pearson correlation coefficient 0.6 (to be checked)
k <- 2
marginal <- list(pbinom(0:2, 3, 1/3),pbinom(0:3, 4, 2/3))
marginal
corrcheck(marginal, support=list(0:3, 0:4)) # check ok
Sigma <- matrix(c(1,0.6,0.6,1),2,2)
# sample size 1000
n <- 1000
# generate a sample of size n
m <- ordsample(n, marginal, Sigma, support=list(0:3,0:4))
head(m)
# sample correlation matrix
cor(m) # compare it with Sigma
# empirical marginal distributions
cumsum(table(m[,1]))/n
cumsum(table(m[,2]))/n # compare them with the two marginal distributions

# Example 2

# draw a sample from a 4-dimensional ordinal variable
# with different number of categories and uniform marginal distributions
# and different correlation coefficients
k <- 4
marginal <- list(0.5, c(1/3,2/3), c(1/4,2/4,3/4), c(1/5,2/5,3/5,4/5))
corrcheck(marginal)
# select a feasible correlation matrix
Sigma <- matrix(c(1,0.5,0.4,0.3,0.5,1,0.5,0.4,0.4,0.5,1,0.5,0.3,0.4,0.5,1),
4, 4, byrow=TRUE)
Sigma
# sample size 100
n <- 100
# generate a sample of size n
set.seed(1)
m <- ordsample(n, marginal, Sigma)
# sample correlation matrix
cor(m) # compare it with Sigma
# empirical marginal distribution
cumsum(table(m[,4]))/n # compare it with the fourth marginal
head(m)
# or equivalently...
set.seed(1)
res <- ordcont(marginal, Sigma)
res[[1]] # the intermediate correlation matrix of the multivariate normal
m <- ordsample(n, marginal, res[[1]], cormat="continuous")
head(m)

# Example 3
# simulation of two correlated Poisson r.v.
# modification to GenOrd sampling function for Poisson distribution
ordsamplep<-function (n, lambda, Sigma) 
{
   k <- length(lambda)
   valori <- mvrnorm(n, rep(0, k), Sigma)
   for (i in 1:k)
   {
   valori[, i] <- qpois(pnorm(valori[,i]), lambda[i])
   }
   return(valori)
}
# number of variables
k <- 2
# Poisson parameters
lambda <- c(2, 5)
# correlation matrix
Sigma <- matrix(0.25, 2, 2)
diag(Sigma) <- 1
# sample size
n <- 10000
# preliminar stage: support TRUNCATION
# required for recovering the correlation matrix
# of the standard bivariate normal
# truncation error
epsilon <- 0.0001
# corresponding maximum value
kmax <- qpois(1-epsilon, lambda)
# truncated marginals
l <- list()
for(i in 1:k)
{
l[[i]] <- 0:kmax[i]
}
marg <- list()
for(i in 1:k)
{
marg[[i]] <- dpois(0:kmax[i],lambda[i])
marg[[i]][kmax[i]+1] <- 1-sum(marg[[i]][1:(kmax[i])])
}
cm <- list()
for(i in 1:k)
{
cm[[i]] <- cumsum(marg[[i]])
cm[[i]] <- cm[[i]][-(kmax[i]+1)]
}
# check feasibility of correlation matrix
RB <- corrcheck(cm, support=l)
RL <- RB[[1]]
RU <- RB[[2]]
Sigma <= RU & Sigma >= RL # OK
res <- ordcont(cm, Sigma, support=l)
res[[1]]
Sigma <- res[[1]]
# draw the sample
m <- ordsamplep(n, lambda, Sigma)
# sample correlation matrix
cor(m)
head(m)

# Example 4
# simulation of 4 correlated binary and Poisson r.v.'s (2+2)
# modification to GenOrd sampling function
ordsamplep <- function (n, marginal, lambda, Sigma) 
{
k <- length(lambda)
valori <- mvrnorm(n, rep(0, k), Sigma)
for(i in 1:k)
{
if(lambda[i]==0)
{
	valori[, i] <- as.integer(cut(valori[, i], breaks = c(min(valori[,i]) - 1,
               qnorm(marginal[[i]]), max(valori[, i]) + 1)))
valori[, i] <- support[[i]][valori[, i]]
}
else
{
	valori[, i] <- qpois(pnorm(valori[,i]), lambda[i])
}
	}
return(valori)
}
# number of variables
k <- 4
# Poisson parameters (only 3rd and 4th are Poisson)
lambda <- c(0, 0, 2, 5)
# 1st and 2nd are Bernoulli with p=0.5
marginal <- list()
marginal[[1]] <- .5
marginal[[2]] <- .5
marginal[[3]] <- 0
marginal[[4]] <- 0
# support
support <- list()
support[[1]] <- 0:1
support[[2]] <- 0:1
# correlation matrix
Sigma <- matrix(0.25, k, k)
diag(Sigma) <- 1
# sample size
n <- 10000
# preliminar stage: support TRUNCATION
# required for recovering the correlation matrix
# of the standard bivariate normal
# truncation error
epsilon <- 0.0001
# corresponding maximum value
kmax <- qpois(1-epsilon, lambda)
# truncated marginals
for(i in 3:4)
{
support[[i]] <- 0:kmax[i]
}
marg <- list()
for(i in 3:4)
{
marg[[i]] <- dpois(0:kmax[i],lambda[i])
marg[[i]][kmax[i]+1] <- 1-sum(marg[[i]][1:(kmax[i])])
}
for(i in 3:4)
{
marginal[[i]] <- cumsum(marg[[i]])
marginal[[i]] <- marginal[[i]][-(kmax[i]+1)]
}
# check feasibility of correlation matrix
RB <- corrcheck(marginal, support=support)
RL <- RB[[1]]
RU <- RB[[2]]
Sigma <= RU & Sigma >= RL # OK
# compute correlation matrix of the 4-variate standard normal
res <- ordcont(marginal, Sigma, support=support)
res[[1]]
Sigma <- res[[1]]
# draw the sample
m <- ordsamplep(n, marginal, lambda, Sigma)
# sample correlation matrix
cor(m)
head(m)



