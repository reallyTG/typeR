library(Davies)


### Name: likelihood
### Title: likelihood for the Davies distribution
### Aliases: likelihood neg.log.likelihood
### Keywords: distribution

### ** Examples

p1 <- c(10, 0.1, 0.1)
p2 <- c(10, 0.4, 0.1)
d <- rdavies(100,p1)
likelihood(p1,d)
likelihood(p2,d)                 #should be smaller.
neg.log.likelihood(p1,rstupid(100)) #should be large negative.



