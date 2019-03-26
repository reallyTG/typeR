library(ConnMatTools)


### Name: d.rel.conn.multiple
### Title: Functions for estimating the probability distribution of
###   relative connectivity values as a weighted sum over possible input
###   parameters
### Aliases: d.rel.conn.multiple p.rel.conn.multiple q.rel.conn.multiple
###   q.rel.conn.multiple.func

### ** Examples

library(ConnMatTools)

# p values have uniform probability between 0.1 and 0.4
p <- seq(0.1,0.8,length.out=100)

# Weights the same for all except first and last, which are halved
w <- rep(1,length(p))
w[1]<-0.5
w[length(w)]<-0.5

n <- 20 # Sample size
k <- 2 # Marked individuals in sample

# phi values to use for plotting distribution
phi <- seq(0,1,0.01)

prior.shape1 = 1 # Uniform prior
# prior.shape1 = 0.5 # Jeffreys prior

# Plot distribution
plot(phi,d.rel.conn.multiple(phi,p,k,n,w,prior.shape1=prior.shape1),
     main="Probability density for relative connectivity",
     xlab=expression(phi),
     ylab="Probability density",
     type="l")

# Add standard distributions for max and min p values
lines(phi,d.rel.conn.beta.prior(phi,min(p),k,n,prior.shape1=prior.shape1),
      col="red",lty="dashed")
lines(phi,d.rel.conn.beta.prior(phi,max(p),k,n,prior.shape1=prior.shape1),
      col="red",lty="dashed")

# Add some quantiles
q = q.rel.conn.multiple(c(0.025,0.25,0.5,0.75,0.975),
                        p,k,n,w,prior.shape1=prior.shape1)
abline(v=q,col="green")



