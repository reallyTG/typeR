context("pgpd")

test_that("pgpd behaves as it should", {
  evd.pgpd <- .evd.pgpd
  myTest <- function(sig, xi, thresh, msg){
      myp <- sapply(1:nreps,function(i) pgpd(x[,i], sig[i], xi[i],u=thresh[i]))
      ep <- sapply(1:nreps, function(i) evd.pgpd(x[,i], loc=thresh[i], scale=sig[i], shape=xi[i]))
      expect_equal(ep, myp, label=msg)
    } # Close myTest

  set.seed(20101111)

  #*************************************************************
  # 6.7. Test pgpd. Note that .evd.pgpd is NOT vectorized.

  nreps <- 100
  nsim <- 1000
  p <- matrix(runif(2*nreps, -1, 1),ncol=2)
  p[, 1] <- p[, 1] + 1
  thresh <- rep(0,nreps)

  x <- sapply(1:nreps,function(i)rgpd(nsim,sigma=p[i,1],xi=p[i,2],u=thresh[i]))

  myTest(sig=p[,1], xi=p[,2],thresh=thresh, msg="pgpd: random xi")

  #*************************************************************
  # 6.8. Test pgpd when some or all of xi == 0

  p[sample(1:nreps,nreps/2),2] <- 0
  x <- sapply(1:nreps,function(i)rgpd(nsim,sigma=p[i,1],xi=p[i,2],u=thresh[i]))
  myTest(sig=p[,1], xi=p[,2], thresh=thresh, msg="pgpd: some zero xi")

  p[,2] <-  0
  x <- sapply(1:nreps,function(i)rgpd(nsim,sigma=p[i,1],xi=p[i,2],u=thresh[i]))
  myTest(sig=p[,1], xi=p[,2], thresh=thresh, msg="pgpd: all zero xi")

  #*************************************************************
  # 6.9. Test vectorization of pgpd.

  sig <- runif(nsim, 0, 2)
  xi <- runif(nsim)
  thresh <- rnorm(nsim)

  x <- rgpd(nsim, sig, xi,u=thresh)
  myp <- pgpd(x, sig, xi,u=thresh)

  ep <- sapply(1:nsim, function(i)evd.pgpd(x[i], loc=thresh[i], scale=sig[i], shape=xi[i]))
  expect_equal(ep, myp, label="pgpd:vectorisation")

  #*************************************************************
  # 6.10 test log.p argument

  lp <- pgpd(x,sig,xi,u=thresh,log.p=TRUE)
  expect_equal(myp, exp(lp), label="pgpd:logprobabilities")

  #*************************************************************
  # 6.11 test lower tail argument

  sp <- pgpd(x,sig,xi,u=thresh,lower.tail=FALSE)
  expect_equal(myp, 1-sp, label="pgpd:lowertail")

  ## check pgpd when q < threshold
  upperProb <- pgpd(0, 1, 1, u=0.5, lower.tail=TRUE)
  expect_equal(upperProb, 0, label="pgpd:valuebelowthreshold(1)")

  lowerProb <- pgpd(0, 1, 1, u=0.5, lower.tail=FALSE)
  expect_equal(upperProb, 0, label="pgpd:valuebelowthreshold(2)")

  ## check pgpd when xi < 0 and value above upper limit

  xi <- -2.3
  upperProb <- pgpd(-2/xi, 1, xi, u=0, lower.tail=TRUE)
  expect_equal(upperProb, 1, label="pgpd:negativexi(1)")

  lowerProb <- pgpd(-2/xi, 1, xi, u=0, lower.tail=FALSE)
  expect_equal(lowerProb, 0, label="pgpd:negativexi(2)")
}
)
