library(ConnMatTools)


### Name: d.rel.conn.multinomial.unnorm
### Title: Calculates unnormalized probability density for relative
###   connectivity values from multiple distinct sites
### Aliases: d.rel.conn.multinomial.unnorm

### ** Examples

library(ConnMatTools)

ps <- c(0.7,0.5) # Fraction of eggs "marked" at each source site
ks <- c(4,5) # Number of marked settlers among sample from each source site
n.sample <- 20 # Total sample size.  Must be >= sum(ks)


phis0 = runif(3,min=0.05)
phis0 = phis0 / sum(phis0)
phis0 = phis0[1:2] # Don't include relative connectivity of unknown sites

nbatch=1e4

library(mcmc)
ans = metrop(d.rel.conn.multinomial.unnorm,
             initial=phis0,nbatch=nbatch,scale=0.1,
             log=TRUE,ps=ps,ks=ks,n.sample=n.sample)
# A more serious test would adjust blen and scale to improve results, and would repeat
# multiple times to get results from multiple MCMC chains.

# Plot marginal distribution of relative connectivity from first site
h=hist(ans$batch[,1],xlab="Rel. Conn., Site 1",
       main="Relative Connectivity for Source Site 1")

# For comparison, add on curve that would correspond to single site calculation
phi = seq(0,1,length.out=40)
d1 = d.rel.conn.beta.prior(phi,ps[1],ks[1],n.sample)

lines(phi,d1*nbatch*diff(h$breaks)[1],col="red",lwd=5)

# Image plot of bivariate probability density
t=table(cut(ans$batch[,1],phi),cut(ans$batch[,2],phi))
image(t,col=heat.colors(12)[12:1],xlab="Rel. Conn., Site 1",ylab="Rel. Conn., Site 2")

# Add line indicate region above which one can never find results as that would 
# lead to a total connectivity great than 1
abline(1,-1,col="black",lty="dashed",lwd=3)



