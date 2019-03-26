library(ResourceSelection)


### Name: simulateUsedAvail
### Title: Simulate Used-Available Data
### Aliases: simulateUsedAvail
### Keywords: manip

### ** Examples

n.used <- 1000
m <- 10
n <- n.used * m
set.seed(1234)
x <- data.frame(x1=rnorm(n), x2=runif(n))
cfs <- c(1.5,-1,0.5)
dat1 <- simulateUsedAvail(x, cfs, n.used, m, link="log")
str(dat1)
dat2 <- simulateUsedAvail(x, cfs, n.used, m, link="logit")
str(dat2)



