library(desiR)


### Name: d.rank
### Title: Converts values to ranks, then ranks to desirabilities
### Aliases: d.rank

### ** Examples

set.seed(1)
x1 <- rnorm(1000, mean=100, sd =5) # generate data
d <- d.rank(x1, low.to.high=TRUE)

# plot data
hist(x1, breaks=30)
# add line
des.line(x1, "d.rank", des.args=c(low.to.high=TRUE))

x2 <- rnorm(1000, mean=0, sd =5) # positive and negative values
# could be fold-changes, mean differences, or t-statistics
hist(abs(x2), breaks=30)
# add line
des.line(abs(x2), "d.rank", des.args=c(low.to.high=FALSE))



