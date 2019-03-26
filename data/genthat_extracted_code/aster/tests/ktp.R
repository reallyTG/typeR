
 library(aster)
 library(numDeriv)

 do.chisq.test <- function(x, k, mu, max.bin) {
     stopifnot(all(x > k))
     stopifnot(k + 1 < max.bin)
     xx <- seq(k + 1, max.bin)
     yy <- dpois(xx, mu)
     yy[length(yy)] <- ppois(max.bin - 1, mu, lower.tail = FALSE)
     pp <- yy / sum(yy)
     ecc <- length(x) * pp
     if (any(ecc < 5.0))
         warning("violates rule of thumb about > 5 expected in each cell")
     cc <- tabulate(x, max.bin)
     cc <- cc[xx]
     cc[length(cc)] <- nsim - sum(cc[- length(cc)])
     chisqstat <- sum((cc - ecc)^2 / ecc)
     pval <- pchisq(chisqstat, length(ecc) - 1, lower.tail = FALSE)
     if (exists("save.min.pval")) {
         save.min.pval <<- min(pval, save.min.pval)
         save.ntests <<- save.ntests + 1
     } else {
         save.min.pval <<- pval
         save.ntests <<- 1
     }
     list(chisqstat = chisqstat, df = length(ecc) - 1, pval = pval,
         observed = cc, expected = ecc, x = xx)
 }

 set.seed(42)
 nsim <- 1e4

 mu <- 10
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout1 <- do.chisq.test(x, k, mu, 22)

 mu <- 3.5
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout2 <- do.chisq.test(x, k, mu, 11)

 mu <- 2.5
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout3 <- do.chisq.test(x, k, mu, 10)

 mu <- 1.5
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout4 <- do.chisq.test(x, k, mu, 8)

 mu <- 0.5
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout5 <- do.chisq.test(x, k, mu, 6)

 nsim <- 1e5
 mu <- 0.1
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout6 <- do.chisq.test(x, k, mu, 5)

 mu <- 0.01
 k <- 2
 x <- rktp(nsim, k, mu)
 chisqout7 <- do.chisq.test(x, k, mu, 4)

 mu <- 1.5
 xpred <- 0:10
 save.seed <- .Random.seed
 x <- rktp(xpred, k, mu, xpred)
 .Random.seed <- save.seed
 my.x <- rep(0, length(xpred))
 for (i in seq(along = xpred))
     if (xpred[i] > 0)
         for (j in 1:xpred[i])
             my.x[i] <- my.x[i] + rktp(1, k, mu)
 all.equal(x, my.x)

 k <- 5
 mu <- pi
 x <- rktp(nsim, k, mu)
 chisqout8 <- do.chisq.test(x, k, mu, 14)

 k <- 10
 mu <- exp(2)
 x <- rktp(nsim, k, mu)
 chisqout9 <- do.chisq.test(x, k, mu, 22)

 cat("number of tests:", save.ntests, "\n")
 save.ntests * save.min.pval > 0.05

 #####

 set.seed(42)
 nind <- 25
 nnode <- 1
 ncoef <- 1
 k <- 2

 pred <- 0
 fam <- 4

 theta <- 4 / 3
 mu <- exp(theta)
 x <- rpois(100, mu)
 x <- x[x > k]
 x <- x[1:nind]

 modmat <- matrix(1, nrow = nind, ncol = 1)
 out <- mlogl(theta, pred, fam, x, modmat, modmat, deriv = 2,
     type = "conditional")

 xxx <- seq(0, 100)
 ppp <- dpois(xxx, mu)
 ppp[xxx <= k] <- 0
 ppp <- ppp / sum(ppp)
 tau <- sum(xxx * ppp)

 all.equal(sum(x - tau), - out$gradient)
 all.equal(length(x) * sum((xxx - tau)^2 * ppp), as.vector(out$hessian))

 foo <- function(theta) {
     stopifnot(is.numeric(theta))
     stopifnot(is.finite(theta))
     stopifnot(length(theta) == 1)
     mlogl(theta, pred, fam, x, modmat, modmat, type = "conditional")$value
 }

 g <- grad(foo, theta)
 all.equal(g, out$gradient)

 h <- hessian(foo, theta)
 all.equal(h, out$hessian)

 foo <- new.env(parent = emptyenv())
 bar <- suppressWarnings(try(load("ktp.rda", foo), silent = TRUE))
 if (inherits(bar, "try-error")) {
     save(list = c(paste("chisqout", 1:9, sep = ""), "out"), file = "ktp.rda")
 } else {
     print(all.equal(chisqout1, foo$chisqout1))
     print(all.equal(chisqout2, foo$chisqout2))
     print(all.equal(chisqout3, foo$chisqout3))
     print(all.equal(chisqout4, foo$chisqout4))
     print(all.equal(chisqout5, foo$chisqout5))
     print(all.equal(chisqout6, foo$chisqout6))
     print(all.equal(chisqout7, foo$chisqout7))
     print(all.equal(chisqout8, foo$chisqout8))
     print(all.equal(chisqout9, foo$chisqout9))
     print(all.equal(out, foo$out))
 }

