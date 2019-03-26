library(IMIS)


### Name: IMIS
### Title: Incremental Mixture Importance Sampling
### Aliases: IMIS

### ** Examples

## Example for multivariate case
likelihood <- function(theta)	dmvnorm(theta, c(1,1), matrix(c(1,0.6,0.6,1),2,2))
prior <- function(theta)	dmvnorm(theta, c(0,0), diag(3,2))
sample.prior <- function(n)	rmvnorm(n, c(0,0), diag(3,2))
result = IMIS(500, 3000, 100, 10)
x1 = x2 = seq(-2, 4, by=0.1)
z = matrix(NA,length(x1),length(x2))
for (i in 1:length(x1))
	for (j in 1:length(x2))
		z[i,j] = likelihood(c(x1[i],x2[j])) * prior(c(x1[i],x2[j]))
contour(x1, x2, z, drawlabels=FALSE, pty="s")
points(result$resample[,1], result$resample[,2], cex=0.1)

## Example for univariate case
likelihood <- function(theta)	exp(-1*sin(3*theta)*sin(theta^2) - 0.1*theta^2)
prior <- function(theta)	dnorm(theta, 0, 5)
sample.prior <- function(n)	rnorm(n, 0, 5)
result = IMIS(500, 3000, 100, 10)
plot(density(result$resample, adjust=0.3), xlim=c(-5,5), main = "wild function")
x = seq(-5, 5, 0.001)
lines(prior(x)*likelihood(x)~x, xlim=c(-5,5), col="red")



