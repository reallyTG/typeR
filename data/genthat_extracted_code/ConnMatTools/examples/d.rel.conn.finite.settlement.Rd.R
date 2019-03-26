library(ConnMatTools)


### Name: d.rel.conn.finite.settlement
### Title: Estimate the probability distribution for the number of settlers
###   originating at a site given a sample from a finite settler pool
### Aliases: d.rel.conn.finite.settlement p.rel.conn.finite.settlement
###   q.rel.conn.finite.settlement

### ** Examples

library(ConnMatTools)

k <- 10 # Number of marked settlers among sample
n.obs <- 87 # Number of settlers in sample
n.settlers <- 100 # Total size of settler pool

p <- 0.4 # Fraction of eggs that was marked
phi <- seq(0,1,length.out=101) # Values for relative connectivity

# Probability distribution assuming infinite settler pool and uniform prior
drc <- d.rel.conn.unif.prior(phi,p,k,n.obs)
prc <- p.rel.conn.unif.prior(phi,p,k,n.obs)
qrc <- q.rel.conn.unif.prior(c(0.025,0.975),p,k,n.obs) # 95% confidence interval

# Test with finite settlement function and large (approx. infinite) settler pool
# Can be a bit slow for large settler pools
dis <- d.rel.conn.finite.settlement(0:(7*n.obs),p,k,n.obs,7*n.obs)

# Quantiles
qis <- q.rel.conn.finite.settlement(c(0.025,0.975),p,k,n.obs,7*n.obs)

# Finite settler pool
dfs <- d.rel.conn.finite.settlement(0:n.settlers,p,k,n.obs,n.settlers)

# Quantiles for the finite settler pool
qfs <- q.rel.conn.finite.settlement(c(0.025,0.975),p,k,n.obs,n.settlers)

# Make a plot of different distributions
plot(phi,drc,type="l",main="Probability of relative connectivity values",
     xlab=expression(phi),ylab="Probability density")
lines(phi,prc,col="blue")
lines((0:(7*n.obs))/(7*n.obs),dis*(7*n.obs),col="black",lty="dashed")
lines((0:n.settlers)/n.settlers,dfs*n.settlers,col="red",lty="dashed")
abline(v=qrc,col="black")
abline(v=qis/(7*n.obs),col="black",lty="dashed")
abline(v=qfs/n.settlers,col="red",lty="dashed")




