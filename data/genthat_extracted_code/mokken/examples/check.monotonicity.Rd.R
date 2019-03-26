library(mokken)


### Name: check.monotonicity
### Title: Check of Monotonicity
### Aliases: check.monotonicity
### Keywords: monotonicity

### ** Examples

data(acl)
Communality <- acl[,1:10]
monotonicity.list <- check.monotonicity(Communality)
plot(monotonicity.list)
summary(monotonicity.list)



