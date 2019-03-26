library(tiger)


### Name: to.uniform
### Title: Transform data to uniform distribution
### Aliases: to.uniform
### Keywords: utilities

### ** Examples

   a <- rnorm(100)
   hist(a)
   b <- to.uniform(a)
   hist(b)
   c <- to.uniform(ref=a, val=c(-0.5,0,0.5))



