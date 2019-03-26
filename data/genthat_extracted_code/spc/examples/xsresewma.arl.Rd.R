library(spc)


### Name: x.res.ewma.arl
### Title: Compute ARLs of EWMA residual control charts
### Aliases: x.res.ewma.arl s.res.ewma.arl xs.res.ewma.arl xs.res.ewma.pms
### Keywords: ts

### ** Examples

## Not run: 
##D ## S. Knoth, W. Schmid (2002)
##D 
##D cat("\nFragments of Table 2 (n=5, lambda.1=lambda.2)\n")
##D 
##D lambdas <- c(.5, .25, .1, .05)
##D L0 <- 500
##D n <- 5
##D 
##D crit <- NULL
##D for ( lambda in lambdas ) {
##D   cs <- xsewma.crit(lambda, lambda, L0, n-1) 
##D   x.e <- round(cs[1], digits=4)
##D   names(x.e) <- NULL
##D   s.e <- round((cs[3]-1) * sqrt((2-lambda)/lambda)*sqrt((n-1)/2), digits=4)
##D   names(s.e) <- NULL
##D   crit <- rbind(crit, data.frame(lambda, x.e, s.e))
##D }
##D 
##D 
##D ## orinal values are (Markov chain approximation with 50 states)
##D # lambda x.e    s.e
##D #   0.50 3.2765 4.6439
##D #   0.25 3.2168 4.0149
##D #   0.10 3.0578 3.3376
##D #   0.05 2.8817 2.9103
##D 
##D print(crit)
##D 
##D 
##D cat("\nFragments of Table 4 (n=5, lambda.1=lambda.2=0.1)\n\n")
##D 
##D lambda <- .1
##D # the algorithm used in Knoth/Schmid is less accurate -- proceed with their values
##D cx <- x.e <- 3.0578
##D s.e <- 3.3376
##D csu <- 1 + s.e * sqrt(lambda/(2-lambda))*sqrt(2/(n-1))
##D 
##D alpha <- .3
##D 
##D a.values <- c((0:6)/4, 2)
##D d.values <- c(1 + (0:5)/10, 1.75 , 2)
##D 
##D arls <- NULL
##D for ( delta in d.values ) {
##D   row <- NULL
##D   for ( mu in a.values ) {
##D     arl <- round(xs.res.ewma.arl(lambda, cx, lambda, csu, mu*sqrt(n), delta, alpha=alpha, n=n),
##D                  digits=2)
##D     names(arl) <- NULL
##D     row <- c(row, arl)   
##D   }
##D   arls <- rbind(arls, data.frame(t(row)))
##D }
##D names(arls) <- a.values
##D rownames(arls) <- d.values
##D 
##D ## orinal values are (now Monte-Carlo with 10^6 replicates)
##D #          0  0.25   0.5 0.75    1 1.25  1.5    2
##D #1    502.44 49.50 14.21 7.93 5.53 4.28 3.53 2.65
##D #1.1   73.19 32.91 13.33 7.82 5.52 4.29 3.54 2.66
##D #1.2   24.42 18.88 11.37 7.44 5.42 4.27 3.54 2.67
##D #1.3   13.11 11.83  9.09 6.74 5.18 4.17 3.50 2.66
##D #1.4    8.74  8.31  7.19 5.89 4.81 4.00 3.41 2.64
##D #1.5    6.50  6.31  5.80 5.08 4.37 3.76 3.28 2.59
##D #1.75   3.94  3.90  3.78 3.59 3.35 3.09 2.83 2.40
##D #2      2.85  2.84  2.80 2.73 2.63 2.51 2.39 2.14
##D 
##D print(arls)
##D 
##D 
##D ## S. Knoth, M. C. Morais, A. Pacheco, W. Schmid (2009)
##D 
##D cat("\nFragments of Table 5 (n=5, lambda=0.1)\n\n")
##D 
##D d.values <- c(1.02, 1 + (1:5)/10, 1.75 , 2)
##D 
##D arl.x <- arl.s <- arl.xs <- PMS.3 <- NULL
##D for ( delta in d.values ) {
##D   arl.x  <- c(arl.x,  round(x.res.ewma.arl(lambda, cx/delta, 0, n=n),
##D                             digits=3))
##D   arl.s  <- c(arl.s,  round(s.res.ewma.arl(lambda, csu, delta, n=n),
##D                             digits=3))
##D   arl.xs <- c(arl.xs, round(xs.res.ewma.arl(lambda, cx, lambda, csu, 0, delta, n=n),
##D                             digits=3))
##D   PMS.3  <- c(PMS.3,  round(xs.res.ewma.pms(lambda, cx, lambda, csu, 0, delta, n=n),
##D                             digits=6))
##D }
##D 
##D ## orinal values are (Markov chain approximation)
##D # delta   arl.x   arl.s  arl.xs PMS.3
##D #  1.02 833.086 518.935 323.324 0.381118
##D #  1.10 454.101  84.208  73.029 0.145005
##D #  1.20 250.665  25.871  24.432 0.071024
##D #  1.30 157.343  13.567  13.125 0.047193
##D #  1.40 108.112   8.941   8.734 0.035945
##D #  1.50  79.308   6.614   6.493 0.029499
##D #  1.75  44.128   3.995   3.942 0.021579
##D #  2.00  28.974   2.887   2.853 0.018220
##D 
##D print(cbind(delta=d.values, arl.x, arl.s, arl.xs, PMS.3))
##D 
##D 
##D cat("\nFragments of Table 6 (n=5, lambda=0.1)\n\n")
##D 
##D alphas <- c(-0.9, -0.5, -0.3, 0, 0.3, 0.5, 0.9)
##D deltas <- c(0.05, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 2)
##D 
##D PMS.4 <- NULL
##D for ( ir in 1:length(deltas) ) {
##D   mu <- deltas[ir]*sqrt(n)
##D   pms <- NULL
##D   for ( alpha in alphas ) {
##D     pms <- c(pms, round(xs.res.ewma.pms(lambda, cx, lambda, csu, mu, 1, type="4", alpha=alpha, n=n),
##D                         digits=6))
##D   }
##D   PMS.4 <- rbind(PMS.4, data.frame(delta=deltas[ir], t(pms)))
##D }
##D names(PMS.4) <- c("delta", alphas)
##D rownames(PMS.4) <- NULL
##D 
##D ## orinal values are (Markov chain approximation)
##D #  delta     -0.9     -0.5     -0.3        0      0.3      0.5      0.9
##D #   0.05 0.055789 0.224521 0.279842 0.342805 0.391299 0.418915 0.471386
##D #   0.25 0.003566 0.009522 0.014580 0.025786 0.044892 0.066584 0.192023
##D #   0.50 0.002994 0.001816 0.002596 0.004774 0.009259 0.015303 0.072945
##D #   0.75 0.006967 0.000703 0.000837 0.001529 0.003400 0.006424 0.046602
##D #   1.00 0.005098 0.000402 0.000370 0.000625 0.001589 0.003490 0.039978
##D #   1.25 0.000084 0.000266 0.000202 0.000300 0.000867 0.002220 0.039773
##D #   1.50 0.000000 0.000256 0.000120 0.000163 0.000531 0.001584 0.042734
##D #   2.00 0.000000 0.000311 0.000091 0.000056 0.000259 0.001029 0.054543
##D 
##D print(PMS.4)
## End(Not run)



