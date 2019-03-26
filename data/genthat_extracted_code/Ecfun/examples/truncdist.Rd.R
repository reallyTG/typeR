library(Ecfun)


### Name: truncdist
### Title: Truncated distribution
### Aliases: truncdist dtruncdist ptruncdist qtruncdist rtruncdist
### Keywords: distribution

### ** Examples

##
## 1.  dtruncdist
##
#  1.1.  Normal 
dx <- dtruncdist(1:4)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dx, dnorm(1:4))
## Don't show: 
)
## End(Don't show)

#  1.2.  Truncated normal between 0 and 1
dx01 <- dtruncdist(seq(-1, 2, .5), truncmin=0, truncmax=1)

# check 
dx01. <- c(0, 0, 0, dnorm(c(.5, 1))/(pnorm(1)-pnorm(0)), 
           0, 0)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dx01, dx01.)
## Don't show: 
)
## End(Don't show)

#  1.3.  lognormal meanlog=log(100), sdlog = 2, truncmin=500 
x10 <- 10^(0:9)
dx10 <- dtruncdist(x10, log(100), 2, dist='lnorm', 
                   truncmin=500)
                  
# check 
dx10. <- (dtruncdist(log(x10), log(100), 2,  
                    truncmin=log(500)) / x10) 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dx10, dx10.)
## Don't show: 
)
## End(Don't show)

#  1.4.  log density of the previous example 
dx10log <- dtruncdist(x10, log(100), 2, log=TRUE, 
                  dist='lnorm', truncmin=500)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dx10log, log(dx10))
## Don't show: 
)
## End(Don't show)

#  1.5.  Poisson without 0.  

dPois0.9 <-dtruncdist(0:9, lambda=1, dist='pois', truncmin=0) 

# check 
dP0.9 <- c(0, dpois(1:9, lambda=1)/ppois(0, lambda=1, lower.tail=FALSE))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(dPois0.9, dP0.9)
## Don't show: 
)
## End(Don't show)

##
## 2.  ptruncdist
##
#  2.1.  Normal 
px <- ptruncdist(1:4)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(px, pnorm(1:4))
## Don't show: 
)
## End(Don't show)

#  2.2.  Truncated normal between 0 and 1 
px01 <- ptruncdist(seq(-1, 2, .5), truncmin=0, truncmax=1)

# check 
px01. <- c(0, 0, (pnorm(c(0, .5, 1)) - pnorm(0))
                     /(pnorm(1)-pnorm(0)), 1, 1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(px01, px01.)
## Don't show: 
)
## End(Don't show)

#  2.3.  lognormal meanlog=log(100), sdlog = 2, truncmin=500 
x10 <- 10^(0:9)
px10 <- ptruncdist(x10, log(100), 2, dist='lnorm', 
                  truncmin=500)
                  
# check 
px10. <- (ptruncdist(log(x10), log(100), 2,  
                     truncmin=log(500))) 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(px10, px10.)
## Don't show: 
)
## End(Don't show)

#  2.4.  log of the previous probabilities 
px10log <- ptruncdist(x10, log(100), 2, log=TRUE, 
                  dist='lnorm', truncmin=500)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(px10log, log(px10))
## Don't show: 
)
## End(Don't show)

##
## 3.  qtruncdist
##
#  3.1.  Normal 
qx <- qtruncdist(seq(0, 1, .2))

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(qx, qnorm(seq(0, 1, .2)))
## Don't show: 
)
## End(Don't show)

#  3.2.  Normal truncated outside (0, 1)
qx01 <- qtruncdist(seq(0, 1, .2), truncmin=0, truncmax=1)

# check 
pxmin <- pnorm(0)
pxmax <- pnorm(1)
unp <- (pxmin + seq(0, 1, .2)*(pxmax-pxmin))
qx01. <- qnorm(unp)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(qx01, qx01.)
## Don't show: 
)
## End(Don't show)

#  3.3.  lognormal meanlog=log(100), sdlog=2, truncmin=500
qlx10 <- qtruncdist(seq(0, 1, .2), log(100), 2, 
                   dist='lnorm', truncmin=500)
                  
# check 
plxmin <- plnorm(500, log(100), 2)
unp. <- (plxmin + seq(0, 1, .2)*(1-plxmin))

qlx10. <- qlnorm(unp., log(100), 2)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(qlx10, qlx10.)
## Don't show: 
)
## End(Don't show)

#  3.4.  previous example with log probabilities 
qlx10l <- qtruncdist(log(seq(0, 1, .2)), log(100), 2, 
                   log.p=TRUE, dist='lnorm', truncmin=500)

# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(qlx10, qlx10l)
## Don't show: 
)
## End(Don't show)

## 
## 4.  rtruncdist 
##
#  4.1.  Normal 
set.seed(1)
rx <- rtruncdist(9)

# check 
set.seed(1)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(rx[1], rnorm(1))
## Don't show: 
)
## End(Don't show)
# Only the first observation matches;  check that.  

#  4.2.  Normal truncated outside (0, 1)
set.seed(1)
rx01 <- rtruncdist(9, truncmin=0, truncmax=1)

# check 
pxmin <- pnorm(0)
pxmax <- pnorm(1)
set.seed(1)
rnp <- (pxmin + runif(9)*(pxmax-pxmin))
rx01. <- qnorm(rnp)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(rx01, rx01.)
## Don't show: 
)
## End(Don't show)

#  4.3.  lognormal meanlog=log(100), sdlog=2, truncmin=500
set.seed(1)
rlx10 <- rtruncdist(9, log(100), 2, 
                   dist='lnorm', truncmin=500)
                  
# check 
plxmin <- plnorm(500, log(100), 2)
set.seed(1)
rnp. <- (plxmin + runif(9)*(1-plxmin))

rlx10. <- qlnorm(rnp., log(100), 2)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(rlx10, rlx10.)
## Don't show: 
)
## End(Don't show)




