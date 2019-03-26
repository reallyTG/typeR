library(distfree.cr)


### Name: distfree.cr
### Title: distfree.cr
### Aliases: distfree.cr

### ** Examples

library(distfree.cr)
dat=data.frame(x=c(rnorm(3000), rnorm(3000, mean=1, sd=2.5)), 
               y=c(rnorm(3000), rnorm(3000, mean=1, sd=2.5)))
pt=distfree.cr(dat, draw=TRUE, alpha=0.05)
pt=distfree.cr(x=dat$x, y=dat$y, draw=FALSE)
plot(pt)



