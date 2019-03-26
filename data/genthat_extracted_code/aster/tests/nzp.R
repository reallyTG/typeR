
 library(aster)

 do.chisq.test <- function(x, mu, max.bin) {
     stopifnot(all(x >= 0))
     xx <- seq(1, max.bin)
     yy <- dpois(xx, mu)
     yy[length(yy)] <- ppois(max.bin - 1, mu, lower.tail = FALSE)
     pp <- yy / sum(yy)
     ecc <- length(x) * pp
     if (any(ecc < 5.0))
         warning("violates rule of thumb about > 5 expected in each cell")
     cc <- tabulate(x, max.bin)
     chisqstat <- sum((cc - ecc)^2 / ecc)
     pval <- pchisq(chisqstat, length(ecc) - 1, lower.tail = FALSE)
     list(chisqstat = chisqstat, df = length(ecc) - 1, pval = pval,
             observed = cc, expected = ecc, x = xx)
 }

 set.seed(42)
 nsim <- 1e4

 mu <- 2.0
 x <- rnzp(nsim, mu)
 chisqout1 <- do.chisq.test(x, mu, 8)

 mu <- 1.0
 x <- rnzp(nsim, mu)
 chisqout2 <- do.chisq.test(x, mu, 5)

 mu <- 0.5
 x <- rnzp(nsim, mu)
 chisqout3 <- do.chisq.test(x, mu, 4)

 nsim <- 1e6
 mu <- 0.05
 x <- rnzp(nsim, mu)
 chisqout4 <- do.chisq.test(x, mu, 4)

 # nsim <- 1e7
 # mu <- 0.005
 # x <- rnzp(nsim, mu)
 # do.chisq.test(x, mu, 3)

 mu <- 0.5
 xpred <- 0:10
 save.seed <- .Random.seed
 x <- rnzp(xpred, mu, xpred)
 .Random.seed <- save.seed
 my.x <- rep(0, length(xpred))
 for (i in seq(along = xpred))
     if (xpred[i] > 0)
         for (j in 1:xpred[i])
             my.x[i] <- my.x[i] + rnzp(1, mu)
 all.equal(x, my.x)

 foo <- new.env(parent = emptyenv())
 bar <- suppressWarnings(try(load("nzp.rda", foo), silent = TRUE))
 if (inherits(bar, "try-error")) {
     save(list = paste("chisqout", 1:4, sep = ""), file = "nzp.rda")
 } else {
     print(all.equal(chisqout1, foo$chisqout1))
     print(all.equal(chisqout2, foo$chisqout2))
     print(all.equal(chisqout3, foo$chisqout3))
     print(all.equal(chisqout4, foo$chisqout4))
 }

