library(extRemes)


### Name: datagrabber.declustered
### Title: Get Original Data from an R Object
### Aliases: datagrabber.declustered datagrabber.extremalindex
###   datagrabber.fevd
### Keywords: data manip

### ** Examples

y <- rnorm(100, mean=40, sd=20)
y <- apply(cbind(y[1:99], y[2:100]), 1, max)
bl <- rep(1:3, each=33)

ydc <- decluster(y, quantile(y, probs=c(0.95)), r=1, blocks=bl)

yorig <- datagrabber(ydc)
all(y - yorig == 0)





