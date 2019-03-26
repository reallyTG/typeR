library(weights)


### Name: wtd.t.test
### Title: Produces weighted Student's t-tests with standard errors and
###   significance.
### Aliases: wtd.t.test
### Keywords: ~t.test ~weights ~bootstrap

### ** Examples

test <- c(1,1,1,1,1,1,2,2,2,3,3,3,4,4)
t2 <- rev(test)+1
weight <- c(.5,.5,.5,.5,.5,1,1,1,1,2,2,2,2,2)

wtd.t.test(test, t2)
wtd.t.test(test, t2, weight)
wtd.t.test(test, t2, weight, bootse=TRUE)



