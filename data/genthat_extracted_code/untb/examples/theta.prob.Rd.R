library(untb)


### Name: theta.prob
### Title: Posterior probabilities for theta
### Aliases: theta.prob theta.likelihood
### Keywords: math

### ** Examples


theta.prob(1,rand.neutral(15,theta=2))

gg <- as.count(c(rep("a",10),rep("b",3),letters[5:9]))
theta.likelihood(theta=2,gg)

optimize(f=theta.likelihood,interval=c(0,100),maximum=TRUE,x=gg)


## An example showing that theta.prob() is indeed a PMF:

a <- count(c(dogs=3,pigs=3,hogs=2,crabs=1,bugs=1,bats=1))
x <- partitions::parts(no.of.ind(a))
f <- function(x){theta.prob(theta=1.123,extant(count(x)),give.log=FALSE)}
sum(apply(x,2,f))  ## should be one exactly.



