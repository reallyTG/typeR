library(mokken)


### Name: plot.monotonicity.class
### Title: Plot monotonicity.class objects
### Aliases: plot.monotonicity.class
### Keywords: plot monotonicity

### ** Examples

data(acl)
Communality <- acl[,1:10]
monotonicity.list <- check.monotonicity(Communality)
plot(monotonicity.list)
summary(monotonicity.list)



