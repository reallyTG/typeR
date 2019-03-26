library(BAEssd)


### Name: summary.BAEssd
### Title: Summarizing BAE Sample Size Calculations
### Aliases: summary.BAEssd print.summary.BAEssd

### ** Examples

############################################################
# One-sample normal experiment with known variance.

# load suite of functions
f1 <- norm1KV.2sided(sigma=5,theta0=0,prob=0.5,mu=2,tau=1)

# compare results of fast method with general method
attach(f1)
ss1 <- ssd.norm1KV(alpha=0.25,w=0.5,logm=logm)
ss2 <- ssd.norm1KV.2sided(alpha=0.25,w=0.5)
detach(f1)

# look at structure
str(summary(ss1))



