library(spc)


### Name: xDewma.arl
### Title: Compute ARLs of EWMA control charts under drift
### Aliases: xDewma.arl
### Keywords: ts

### ** Examples

## Not run: 
##D DxDewma.arl <- Vectorize(xDewma.arl, "delta")
##D ## Gan (1991)
##D ## Table 1
##D ## original values are
##D #  delta   arlE1  arlE2  arlE3
##D #  0       500    500    500
##D #  0.0001  482    460    424
##D #  0.0010  289    231    185
##D #  0.0020  210    162    129
##D #  0.0050  126     94.6   77.9
##D #  0.0100   81.7   61.3   52.7
##D #  0.0500   27.5   21.8   21.9
##D #  0.1000   17.0   14.2   15.3
##D #  1.0000    4.09   4.28   5.25
##D #  3.0000    2.60   2.90   3.43
##D #
##D lambda1 <- 0.676
##D lambda2 <- 0.242
##D lambda3 <- 0.047
##D h1 <- 2.204/sqrt(lambda1/(2-lambda1))
##D h2 <- 1.111/sqrt(lambda2/(2-lambda2))
##D h3 <- 0.403/sqrt(lambda3/(2-lambda3))
##D deltas <- c(.0001, .001, .002, .005, .01, .05, .1, 1, 3)
##D arlE10 <- round(xewma.arl(lambda1, h1, 0, sided="two"), digits=2)
##D arlE1 <- c(arlE10, round(DxDewma.arl(lambda1, h1, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D arlE20 <- round(xewma.arl(lambda2, h2, 0, sided="two"), digits=2)
##D arlE2 <- c(arlE20, round(DxDewma.arl(lambda2, h2, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D arlE30 <- round(xewma.arl(lambda3, h3, 0, sided="two"), digits=2)
##D arlE3 <- c(arlE30, round(DxDewma.arl(lambda3, h3, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D data.frame(delta=c(0, deltas), arlE1, arlE2, arlE3)
##D 
##D ## do the same with more digits for the alarm threshold
##D L0 <- 500
##D h1 <- xewma.crit(lambda1, L0, sided="two")
##D h2 <- xewma.crit(lambda2, L0, sided="two")
##D h3 <- xewma.crit(lambda3, L0, sided="two")
##D lambdas <- c(lambda1, lambda2, lambda3)
##D hs <- c(h1, h2, h3) * sqrt(lambdas/(2-lambdas))
##D hs
##D # compare with Gan's values 2.204, 1.111, 0.403
##D round(hs, digits=3)
##D 
##D arlE10 <- round(xewma.arl(lambda1, h1, 0, sided="two"), digits=2)
##D arlE1 <- c(arlE10, round(DxDewma.arl(lambda1, h1, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D arlE20 <- round(xewma.arl(lambda2, h2, 0, sided="two"), digits=2)
##D arlE2 <- c(arlE20, round(DxDewma.arl(lambda2, h2, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D arlE30 <- round(xewma.arl(lambda3, h3, 0, sided="two"), digits=2)
##D arlE3 <- c(arlE30, round(DxDewma.arl(lambda3, h3, deltas, sided="two", with0=TRUE),
##D                          digits=2))
##D data.frame(delta=c(0, deltas), arlE1, arlE2, arlE3)
##D 
##D ## Aerne et al. (1991) -- two-sided EWMA
##D ## Table I (continued)
##D ## original numbers are
##D #     delta  arlE1  arlE2  arlE3
##D #  0.000000  465.0  465.0  465.0
##D #  0.005623  77.01  85.93  102.68
##D #  0.007499  64.61  71.78  85.74
##D #  0.010000  54.20  59.74  71.22
##D #  0.013335  45.20  49.58  58.90
##D #  0.017783  37.76  41.06  48.54
##D #  0.023714  31.54  33.95  39.87
##D #  0.031623  26.36  28.06  32.68
##D #  0.042170  22.06  23.19  26.73
##D #  0.056234  18.49  19.17  21.84
##D #  0.074989  15.53  15.87  17.83
##D #  0.100000  13.07  13.16  14.55
##D #  0.133352  11.03  10.94  11.88
##D #  0.177828   9.33   9.12   9.71
##D #  0.237137   7.91   7.62   7.95
##D #  0.316228   6.72   6.39   6.52
##D #  0.421697   5.72   5.38   5.37
##D #  0.562341   4.88   4.54   4.44
##D #  0.749894   4.18   3.84   3.68
##D #  1.000000   3.58   3.27   3.07
##D #
##D lambda1 <- .133
##D lambda2 <- .25
##D lambda3 <- .5
##D cE1 <- 2.856
##D cE2 <- 2.974
##D cE3 <- 3.049
##D deltas <- 10^(-(18:0)/8)
##D arlE10 <- round(xewma.arl(lambda1, cE1, 0, sided="two"), digits=2)
##D arlE1 <- c(arlE10, round(DxDewma.arl(lambda1, cE1, deltas, sided="two"), digits=2))
##D arlE20 <- round(xewma.arl(lambda2, cE2, 0, sided="two"), digits=2)
##D arlE2 <- c(arlE20, round(DxDewma.arl(lambda2, cE2, deltas, sided="two"), digits=2))
##D arlE30 <- round(xewma.arl(lambda3, cE3, 0, sided="two"), digits=2)
##D arlE3 <- c(arlE30, round(DxDewma.arl(lambda3, cE3, deltas, sided="two"), digits=2))
##D data.frame(delta=c(0, round(deltas, digits=6)), arlE1, arlE2, arlE3)
##D 
##D 
##D ## Fahmy/Elsayed (2006) -- two-sided EWMA
##D ## Table 4 (Monte Carlo results, 10^4 replicates, change point at t=51!)
##D ## original numbers are
##D #   delta     arl  s.e.
##D #   0.00  365.749  3.598
##D #   0.10   12.971  0.029
##D #   0.25    7.738  0.015
##D #   0.50    5.312  0.009
##D #   0.75    4.279  0.007
##D #   1.00    3.680  0.006
##D #   1.25    3.271  0.006
##D #   1.50    2.979  0.005
##D #   1.75    2.782  0.004
##D #   2.00    2.598  0.005
##D #
##D lambda <- 0.1
##D cE <- 2.7
##D deltas <- c(.1, (1:8)/4)
##D arlE1 <- c(round(xewma.arl(lambda, cE, 0, sided="two"), digits=3),
##D            round(DxDewma.arl(lambda, cE, deltas, sided="two"), digits=3))
##D arlE51 <- c(round(xewma.arl(lambda, cE, 0, sided="two", q=51)[51], digits=3),
##D      round(DxDewma.arl(lambda, cE, deltas, sided="two", mode="Knoth", q=51),
##D            digits=3))
##D data.frame(delta=c(0, deltas), arlE1, arlE51)
##D 
##D ## additional Monte Carlo results with 10^8 replicates
##D #   delta   arl.q=1   s.e.    arl.q=51  s.e.
##D #   0.00    368.910   0.036   361.714   0.038
##D #   0.10     12.986   0.000    12.781   0.000
##D #   0.25      7.758   0.000     7.637   0.000
##D #   0.50      5.318   0.000     5.235   0.000
##D #   0.75      4.285   0.000     4.218   0.000
##D #   1.00      3.688   0.000     3.628   0.000
##D #   1.25      3.274   0.000     3.233   0.000
##D #   1.50      2.993   0.000     2.942   0.000
##D #   1.75      2.808   0.000     2.723   0.000
##D #   2.00      2.616   0.000     2.554   0.000
##D 
##D ## Zou et al. (2009) -- one-sided EWMA
##D ## Table 1
##D ## original values are
##D #  delta   arl1  arl2  arl3
##D #  0           ~ 1730
##D #  0.0005  317   377   440
##D #  0.001   215   253   297
##D #  0.005   83.6  92.6  106
##D #  0.01    55.6  58.8  66.1
##D #  0.05    22.6  21.1  22.0
##D #  0.1     15.5  13.9  13.8
##D #  0.5     6.65  5.56  5.09
##D #  1.0     4.67  3.83  3.43
##D #  2.0     3.21  2.74  2.32
##D #  3.0     2.86  2.06  1.98
##D #  4.0     2.14  2.00  1.83
##D l1 <- 0.03479
##D l2 <- 0.11125
##D l3 <- 0.23052
##D c1 <- 2.711
##D c2 <- 3.033
##D c3 <- 3.161
##D zr <- -6
##D r  <- 50
##D deltas <- c(0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1:4)
##D arl1 <- c(round(xewma.arl(l1, c1, 0, zr=zr, r=r), digits=2),
##D           round(DxDewma.arl(l1, c1, deltas, zr=zr, r=r), digits=2))
##D arl2 <- c(round(xewma.arl(l2, c2, 0, zr=zr), digits=2),
##D           round(DxDewma.arl(l2, c2, deltas, zr=zr, r=r), digits=2))
##D arl3 <- c(round(xewma.arl(l3, c3, 0, zr=zr, r=r), digits=2),
##D           round(DxDewma.arl(l3, c3, deltas, zr=zr, r=r), digits=2))
##D data.frame(delta=c(0, deltas), arl1, arl2, arl3)
## End(Not run)



