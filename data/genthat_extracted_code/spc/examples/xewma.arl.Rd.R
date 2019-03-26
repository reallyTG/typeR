library(spc)


### Name: xewma.arl
### Title: Compute ARLs of EWMA control charts
### Aliases: xewma.arl
### Keywords: ts

### ** Examples

## Waldmann (1986), one-sided EWMA
l <- .75
round(xewma.arl(l,2*sqrt((2-l)/l),0,zr=-4*sqrt((2-l)/l)),digits=1)
l <- .5
round(xewma.arl(l,2*sqrt((2-l)/l),0,zr=-4*sqrt((2-l)/l)),digits=1)
## original values are 209.3 and 3907.5 (in Table 2).

## Waldmann (1986), two-sided EWMA with fixed control limits
l <- .75
round(xewma.arl(l,2*sqrt((2-l)/l),0,sided="two"),digits=1)
l <- .5
round(xewma.arl(l,2*sqrt((2-l)/l),0,sided="two"),digits=1)
## original values are 104.0 and 1952 (in Table 1).

## Crowder (1987), two-sided EWMA with fixed control limits
l1 <- .5
l2 <- .05
c <- 2
mu <- (0:16)/4
arl1 <- sapply(mu,l=l1,c=c,sided="two",xewma.arl)
arl2 <- sapply(mu,l=l2,c=c,sided="two",xewma.arl)
round(cbind(mu,arl1,arl2),digits=2)

## original results are (in Table 1)
## 0.00 26.45 127.53
## 0.25 20.12  43.94
## 0.50 11.89  18.97
## 0.75  7.29  11.64
## 1.00  4.91   8.38
## 1.25  3.95*  6.56
## 1.50  2.80   5.41
## 1.75  2.29   4.62
## 2.00  1.94   4.04
## 2.25  1.70   3.61
## 2.50  1.51   3.26
## 2.75  1.37   2.99
## 3.00  1.26   2.76
## 3.25  1.18   2.56
## 3.50  1.12   2.39
## 3.75  1.08   2.26
## 4.00  1.05   2.15  (* -- in Crowder (1987) typo!?)

## Lucas/Saccucci (1990)
## two-sided EWMA

## with fixed limits
l1 <- .5
l2 <- .03
c1 <- 3.071
c2 <- 2.437
mu <- c(0,.25,.5,.75,1,1.5,2,2.5,3,3.5,4,5)
arl1 <- sapply(mu,l=l1,c=c1,sided="two",xewma.arl)
arl2 <- sapply(mu,l=l2,c=c2,sided="two",xewma.arl)
round(cbind(mu,arl1,arl2),digits=2)

## original results are (in Table 3)
## 0.00 500.   500.
## 0.25 255.    76.7
## 0.50  88.8   29.3
## 0.75  35.9   17.6
## 1.00  17.5   12.6
## 1.50   6.53   8.07
## 2.00   3.63   5.99
## 2.50   2.50   4.80
## 3.00   1.93   4.03
## 3.50   1.58   3.49
## 4.00   1.34   3.11
## 5.00   1.07   2.55

## Not run: 
##D ## with fir feature
##D l1 <- .5
##D l2 <- .03
##D c1 <- 3.071
##D c2 <- 2.437
##D hs1 <- c1/2
##D hs2 <- c2/2
##D mu <- c(0,.5,1,2,3,5)
##D arl1 <- sapply(mu,l=l1,c=c1,hs=hs1,sided="two",limits="fir",xewma.arl)
##D arl2 <- sapply(mu,l=l2,c=c2,hs=hs2,sided="two",limits="fir",xewma.arl)
##D round(cbind(mu,arl1,arl2),digits=2)
##D 
##D ## original results are (in Table 5)
##D ## 0.0 487.   406.
##D ## 0.5  86.1   18.4
##D ## 1.0  15.9    7.36
##D ## 2.0   2.87   3.43
##D ## 3.0   1.45   2.34
##D ## 5.0   1.01   1.57
##D 
##D ## Chandrasekaran, English, Disney (1995)
##D ## two-sided EWMA with fixed and variance adjusted limits (vacl)
##D 
##D l1 <- .25
##D l2 <- .1
##D c1s <- 2.9985
##D c1n <- 3.0042
##D c2s <- 2.8159
##D c2n <- 2.8452
##D mu <- c(0,.25,.5,.75,1,2)
##D arl1s <- sapply(mu,l=l1,c=c1s,sided="two",xewma.arl)
##D arl1n <- sapply(mu,l=l1,c=c1n,sided="two",limits="vacl",xewma.arl)
##D arl2s <- sapply(mu,l=l2,c=c2s,sided="two",xewma.arl)
##D arl2n <- sapply(mu,l=l2,c=c2n,sided="two",limits="vacl",xewma.arl)
##D round(cbind(mu,arl1s,arl1n,arl2s,arl2n),digits=2)
##D 
##D ## original results are (in Table 2)
##D ## 0.00 500.   500.   500.   500.
##D ## 0.25 170.09 167.54 105.90  96.6
##D ## 0.50  48.14  45.65  31.08  24.35
##D ## 0.75  20.02  19.72  15.71  10.74
##D ## 1.00  11.07   9.37  10.23   6.35
##D ## 2.00   3.59   2.64   4.32   2.73
##D 
##D ## The results in Chandrasekaran, English, Disney (1995) are not
##D ## that accurate. Let us consider the more appropriate comparison
##D 
##D c1s <- xewma.crit(l1,500,sided="two")
##D c1n <- xewma.crit(l1,500,sided="two",limits="vacl")
##D c2s <- xewma.crit(l2,500,sided="two")
##D c2n <- xewma.crit(l2,500,sided="two",limits="vacl")
##D mu <- c(0,.25,.5,.75,1,2)
##D arl1s <- sapply(mu,l=l1,c=c1s,sided="two",xewma.arl)
##D arl1n <- sapply(mu,l=l1,c=c1n,sided="two",limits="vacl",xewma.arl)
##D arl2s <- sapply(mu,l=l2,c=c2s,sided="two",xewma.arl)
##D arl2n <- sapply(mu,l=l2,c=c2n,sided="two",limits="vacl",xewma.arl)
##D round(cbind(mu,arl1s,arl1n,arl2s,arl2n),digits=2)
##D 
##D ## which demonstrate the abilities of the variance-adjusted limits
##D ## scheme more explicitely.
##D 
##D ## Rhoads, Montgomery, Mastrangelo (1996)
##D ## two-sided EWMA with fixed and variance adjusted limits (vacl),
##D ## with fir and both features
##D 
##D l <- .03
##D c <- 2.437
##D mu <- c(0,.5,1,1.5,2,3,4)
##D sl <- sqrt(l*(2-l))
##D arlfix  <- sapply(mu,l=l,c=c,sided="two",xewma.arl)
##D arlvacl <- sapply(mu,l=l,c=c,sided="two",limits="vacl",xewma.arl)
##D arlfir  <- sapply(mu,l=l,c=c,hs=c/2,sided="two",limits="fir",xewma.arl)
##D arlboth <- sapply(mu,l=l,c=c,hs=c/2*sl,sided="two",limits="both",xewma.arl)
##D round(cbind(mu,arlfix,arlvacl,arlfir,arlboth),digits=1)
##D 
##D ## original results are (in Table 1)
##D ## 0.0 477.3* 427.9* 383.4* 286.2*
##D ## 0.5  29.7   20.0   18.6   12.8
##D ## 1.0  12.5    6.5    7.4    3.6
##D ## 1.5   8.1    3.3    4.6    1.9
##D ## 2.0   6.0    2.2    3.4    1.4
##D ## 3.0   4.0    1.3    2.4    1.0
##D ## 4.0   3.1    1.1    1.9    1.0
##D ## * -- the in-control values differ sustainably from the true values!
##D 
##D ## Steiner (1999)
##D ## two-sided EWMA control charts with various modifications
##D 
##D ## fixed vs. variance adjusted limits
##D 
##D l <- .05
##D c <- 3
##D mu <- c(0,.25,.5,.75,1,1.5,2,2.5,3,3.5,4)
##D arlfix <- sapply(mu,l=l,c=c,sided="two",xewma.arl)
##D arlvacl <- sapply(mu,l=l,c=c,sided="two",limits="vacl",xewma.arl)
##D round(cbind(mu,arlfix,arlvacl),digits=1)
##D 
##D ## original results are (in Table 2)
##D ## 0.00 1379.0   1353.0
##D ## 0.25  135.0    127.0
##D ## 0.50   37.4     32.5 
##D ## 0.75   20.0     15.6
##D ## 1.00   13.5      9.0
##D ## 1.50    8.3      4.5
##D ## 2.00    6.0      2.8
##D ## 2.50    4.8      2.0
##D ## 3.00    4.0      1.6
##D ## 3.50    3.4      1.3
##D ## 4.00    3.0      1.1
##D 
##D ## fir, both, and Steiner's modification
##D 
##D l <- .03
##D cfir <- 2.44
##D cboth <- 2.54
##D cstein <- 2.55
##D hsfir <- cfir/2
##D hsboth <- cboth/2*sqrt(l*(2-l))
##D mu <- c(0,.5,1,1.5,2,3,4)
##D arlfir <- sapply(mu,l=l,c=cfir,hs=hsfir,sided="two",limits="fir",xewma.arl)
##D arlboth <- sapply(mu,l=l,c=cboth,hs=hsboth,sided="two",limits="both",xewma.arl)
##D arlstein <- sapply(mu,l=l,c=cstein,sided="two",limits="Steiner",xewma.arl)
##D round(cbind(mu,arlfir,arlboth,arlstein),digits=1)
##D 
##D ## original values are (in Table 5)
##D ## 0.0 383.0   384.0   391.0
##D ## 0.5  18.6    14.9    13.8
##D ## 1.0   7.4     3.9     3.6
##D ## 1.5   4.6     2.0     1.8
##D ## 2.0   3.4     1.4     1.3
##D ## 3.0   2.4     1.1     1.0
##D ## 4.0   1.9     1.0     1.0
##D 
##D ## SAS/QC manual 1999
##D ## two-sided EWMA control charts with fixed limits
##D 
##D l <- .25
##D c <- 3
##D mu <- 1
##D print(xewma.arl(l,c,mu,sided="two"),digits=11)
##D 
##D # original value is 11.154267016.
##D 
##D ## Some recent examples for one-sided EWMA charts
##D ## with varying limits and in the so-called stationary mode
##D 
##D # 1. varying limits = "vacl"
##D 
##D lambda <- .1
##D L0 <- 500
##D 
##D ## Monte Carlo results (10^9 replicates)
##D # mu    ARL      s.e.
##D # 0     500.00   0.0160
##D # 0.5   21.637   0.0006
##D # 1     6.7596   0.0001
##D # 1.5   3.5398   0.0001
##D # 2     2.3038   0.0000
##D # 2.5   1.7004   0.0000
##D # 3     1.3675   0.0000
##D 
##D zr <- -6
##D r <- 50
##D c <- xewma.crit(lambda, L0, zr=zr, limits="vacl", r=r)
##D Mxewma.arl <- Vectorize(xewma.arl, "mu")
##D mus <- (0:6)/2
##D arls <- round(Mxewma.arl(lambda, c, mus, zr=zr, limits="vacl", r=r), digits=4)
##D data.frame(mus, arls)
##D 
##D # 2. stationary mode, i. e. limits = "stat"
##D 
##D ## Monte Carlo results (10^9 replicates)
##D # mu    ARL      s.e.
##D # 0     500.00   0.0159
##D # 0.5   22.313   0.0006
##D # 1     7.2920   0.0001
##D # 1.5   3.9064   0.0001
##D # 2     2.5131   0.0000
##D # 2.5   1.7983   0.0000
##D # 3     1.4029   0.0000
##D 
##D c <- xewma.crit(lambda, L0, zr=zr, limits="stat", r=r)
##D arls <- round(Mxewma.arl(lambda, c, mus, zr=zr, limits="stat", r=r), digits=4)
##D data.frame(mus, arls)
## End(Not run)



