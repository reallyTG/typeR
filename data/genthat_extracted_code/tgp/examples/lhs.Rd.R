library(tgp)


### Name: lhs
### Title: Latin Hypercube sampling
### Aliases: lhs
### Keywords: design spatial

### ** Examples

# get and plot a 2-d LH design
s1 <- lhs(10, rbind(c(-2,3), c(0.5, 0.8)))
plot(s1)

# plot a grid to show that there is one sample
# in each grid location
abline(v=seq(-2,3,length=11), lty=2, col=3)
abline(h=seq(0.5,0.8,length=11), lty=2, col=3)



