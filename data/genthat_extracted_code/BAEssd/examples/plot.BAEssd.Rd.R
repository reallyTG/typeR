library(BAEssd)


### Name: plot.BAEssd
### Title: Plotting Average Errors
### Aliases: plot.BAEssd

### ** Examples

############################################################
# Construct a plot of the Total Error as a function of
# sample size for a one-sample normal experiment with known
# variance.

# load suite of functions
f1 <- norm1KV.2sided(sigma=5,theta0=0,prob=0.5,mu=2,tau=1)

# get TE for many more sample sizes larger than the optimal
attach(f1)
ss1 <- ssd.norm1KV.2sided(alpha=0.25,w=0.5,minn=2,maxn=200,all=TRUE)
ss1
detach(f1)

# create plot of Total Error
plot(ss1)

# create plot of Average Type-I Error
plot(ss1,y="AE1",alpha.line=FALSE)
abline(h=0.05,lty=2)



