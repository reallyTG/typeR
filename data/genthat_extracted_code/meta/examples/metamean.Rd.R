library(meta)


### Name: metamean
### Title: Meta-analysis of single means
### Aliases: metamean
### Keywords: htest

### ** Examples

m1 <- metamean(rep(100, 3), 1:3, rep(1, 3))
m2 <- update(m1, sm="MLN")

m1
m2

# With test for overall mean equal to 2
#
update(m1, null.effect=2)
update(m2, null.effect=2)

# Print results without back-transformation
#
print(m1, backtransf=FALSE)
update(m2, backtransf=FALSE)
update(m1, null.effect=2, backtransf=FALSE)
update(m2, null.effect=2, backtransf=FALSE)



