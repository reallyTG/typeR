library(shotGroups)


### Name: mvnEll
### Title: Multivariate normal offset ellipse probabilities
### Aliases: mvnEll pmvnEll qmvnEll rmvnEll

### ** Examples

# define a bivariate normal distribution
mu    <- c(2, -1)                        # true mean
sigma <- cbind(c(10, 6), c(6, 10))       # covariance matrix

# define circular integration region
ctr <- c(1, 0)                           # center
e1  <- diag(2)                           # circle
r   <- 2                                 # radius
pmvnEll(r,   sigma=sigma, mu=mu, e=e1, x0=ctr) # probability
qmvnEll(0.5, sigma=sigma, mu=mu, e=e1, x0=ctr) # quantile
rmvnEll(5,   sigma=sigma, mu=mu, e=e1, x0=ctr) # random numbers

# define elliptical integration region
S  <- cbind(c(3.5, -0.3), c(-0.3, 1.7))
e2 <- solve(S)
pmvnEll(r,   sigma=sigma, mu=mu, e=e2, x0=ctr) # probability
qmvnEll(0.5, sigma=sigma, mu=mu, e=e2, x0=ctr) # quantile
rmvnEll(5,   sigma=sigma, mu=mu, e=e2, x0=ctr) # random numbers

# plot all regions
evSig <- eigen(sigma)$values
evS   <- eigen(S)$values
xLims <- range(c( mu[1]+c(-1, 1)*sqrt(evSig[1]),
                 ctr[1]+c(-r, r)*sqrt(evS[1])))
yLims <- range(c( mu[2]+c(-1.25, 1.25)*sqrt(evSig[1]),
                 ctr[2]+c(-r, r)*sqrt(evS[1])))

plot(xLims, yLims, type="n", asp=1)
points(mu[1],  mu[2],  pch=16, cex=2, col="black")
points(ctr[1], ctr[2], pch=15, cex=2, col="blue")
drawEllipse(mu, sigma, r=0.75, fg="black")
drawEllipse(mu, sigma, r=1,    fg="black")
drawEllipse(mu, sigma, r=1.25, fg="black")
drawEllipse(mu, sigma, r=1.5,  fg="black")
drawEllipse(ctr, e1, r=r, fg="blue")
drawEllipse(ctr, S,  r=r, fg="red")
legend(x="bottomright", legend=c("normal iso-densities",
       "integration circle", "integration ellipse"),
       lty=1, col=c("black", "blue", "red"))



