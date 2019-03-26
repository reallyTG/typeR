library(BAEssd)


### Name: GammaGamma
### Title: The Gamma-Gamma Distribution
### Aliases: GammaGamma dggamma rggamma

### ** Examples

############################################################
# Construct a plot of the density function with median and
# quantiles marked.

# define parameters
shape1 <- 4
rate1 <- 4
shape2 <- 20

# construct density plot
x <- seq(0.1,150,0.1)
plot(dggamma(x,shape1,rate1,shape2)~x,
     type="l",lwd=2,main="",xlab="x",ylab="Density f(x)")
     
# determine median and quantiles
set.seed(123)
X <- rggamma(5000,shape1,rate1,shape2)
quants <- quantile(X,prob=c(0.25,0.5,0.75))

# add quantities to plot
abline(v=quants,lty=c(3,2,3),lwd=2)


############################################################
# Consider the following set-up:
#   Let x ~ N(theta,sigma2), sigma2 is unknown variance.
#   Consider a prior on theta and sigma2 defined by
#      theta|sigma2 ~ N(mu,(r*sigma)^2)
#      sigma2 ~ InverseGamma(a/2,b/2), (b/2) = rate.
#
#   We want to generate random variables from the marginal
#   (prior predictive) distribution of the sufficient
#   statistic T = (xbar,s2) where the sample size n = 25.

# define parameters
a <- 4
b <- 4
mu <- 1 
r <- 3
n <- 25


# generate random variables from Gamma-Gamma
set.seed(123)
shape1 <- a/2
rate1 <- b
shape2 <- 0.5*(n-1)

Y <- rggamma(5000,shape1,rate1,shape2)

# generate variables from a non-central t given Y
df <- n+a-1
scale <- (Y+b)*(1/n + r^2)/(n+a-1)

X <- rt(5000,df=df)*sqrt(scale) + mu

# the pair (X,Y) comes from the correct marginal density

# mean of xbar and s2, and xbar*s2
mean(X)
mean(Y)
mean(X*Y)



