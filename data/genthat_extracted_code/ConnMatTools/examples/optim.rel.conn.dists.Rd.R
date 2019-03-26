library(ConnMatTools)


### Name: optim.rel.conn.dists
### Title: Maximum-likelihood estimate for relative connectivity given two
###   distributions for scores for marked and unmarked individuals
### Aliases: optim.rel.conn.dists

### ** Examples

library(ConnMatTools)
data(damselfish.lods)

# Histograms of simulated LODs
l <- seq(-1,30,0.5)
h.in <- hist(damselfish.lods$in.group,breaks=l)
h.out <- hist(damselfish.lods$out.group,breaks=l)

# PDFs for marked and unmarked individuals based on simulations
d.marked <- stepfun.hist(h.in)
d.unmarked <- stepfun.hist(h.out)

# Fraction of adults genotyped at source site
p.adults <- 0.25

# prior.shape1=1 # Uniform prior
prior.shape1=0.5 # Jeffreys prior

# Fraction of eggs from one or more genotyped parents
p <- dual.mark.transmission(p.adults)$p

# PDF for relative connectivity
D <- d.rel.conn.dists.func(damselfish.lods$real.children,
                           d.unmarked,d.marked,p,
                           prior.shape1=prior.shape1)

# Estimate most probable value for relative connectivity
phi.mx <- optim.rel.conn.dists(damselfish.lods$real.children,
                                    d.unmarked,d.marked,p)$phi

# Estimate 95% confidence interval for relative connectivity
Q <- q.rel.conn.dists.func(damselfish.lods$real.children,
                           d.unmarked,d.marked,p,
                           prior.shape1=prior.shape1)

# Plot it up
phi <- seq(0,1,0.001)
plot(phi,D(phi),type="l",
     xlim=c(0,0.1),
     main="PDF for relative connectivity",
     xlab=expression(phi),
     ylab="Probability density")

abline(v=phi.mx,col="green",lty="dashed")
abline(v=Q(c(0.025,0.975)),col="red",lty="dashed")



