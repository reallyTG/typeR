library(ConnMatTools)


### Name: d.rel.conn.beta.prior
### Title: Estimate the probability distribution of relative connectivity
###   values assuming a Beta-distributed prior
### Aliases: d.rel.conn.beta.prior p.rel.conn.beta.prior
###   q.rel.conn.beta.prior q.rel.conn.beta.prior.func

### ** Examples

library(ConnMatTools)

k <- 10 # Number of marked settlers among sample
n.obs <- 87 # Number of settlers in sample

p <- 0.4 # Fraction of eggs that was marked
phi <- seq(0.001,1-0.001,length.out=101) # Values for relative connectivity

# Probability distribution assuming infinite settler pool and uniform prior
drc <- d.rel.conn.unif.prior(phi,p,k,n.obs)
qrc <- q.rel.conn.unif.prior(c(0.025,0.975),p,k,n.obs) # 95% confidence interval

# Probability distribution assuming infinite settler pool and using reference/Jeffreys prior
drp <- d.rel.conn.beta.prior(phi,p,k,n.obs)
prp <- p.rel.conn.beta.prior(phi,p,k,n.obs)
qrp <- q.rel.conn.beta.prior(c(0.025,0.975),p,k,n.obs) # 95% confidence interval

# Make a plot of different distributions
# black = Jeffreys prior; red = uniform prior
# Jeffreys prior draws distribution slightly towards zero
plot(phi,drp,type="l",main="Probability of relative connectivity values",
     xlab=expression(phi),ylab="Probability density")
lines(phi,drc,col="red")
abline(v=qrp,col="black",lty="dashed")
abline(v=qrc,col="red",lty="dashed")



