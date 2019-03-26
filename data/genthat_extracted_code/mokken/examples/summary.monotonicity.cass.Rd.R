library(mokken)


### Name: summary.monotonicity.class
### Title: Summarize monotonicity.class objects
### Aliases: summary.monotonicity.class
### Keywords: summary monotonicity

### ** Examples

data(acl)
Communality <- acl[,1:10]
monotonicity.list <- check.monotonicity(Communality)
plot(monotonicity.list)
summary(monotonicity.list)



