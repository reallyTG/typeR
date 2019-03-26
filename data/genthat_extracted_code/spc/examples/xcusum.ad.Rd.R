library(spc)


### Name: xcusum.ad
### Title: Compute steady-state ARLs of CUSUM control charts
### Aliases: xcusum.ad
### Keywords: ts

### ** Examples

## comparison of zero-state (= worst case ) and steady-state performance
## for one-sided CUSUM control charts

k <- .5
h <- xcusum.crit(k,500)
mu <- c(0,.5,1,1.5,2)
arl <- sapply(mu,k=k,h=h,xcusum.arl)
ad <- sapply(mu,k=k,h=h,xcusum.ad)
round(cbind(mu,arl,ad),digits=2)

## Crosier (1986), Crosier's modified two-sided CUSUM
## He introduced the modification and evaluated it by means of
## Markov chain approximation

k <- .5
h2 <- 4
hC <- 3.73
mu <- c(0,.25,.5,.75,1,1.5,2,2.5,3,4,5)
ad2 <- sapply(mu,k=k,h=h2,sided="two",r=20,xcusum.ad)
adC <- sapply(mu,k=k,h=hC,sided="Crosier",xcusum.ad)
round(cbind(mu,ad2,adC),digits=2)

## results in the original paper are (in Table 5)
## 0.00 163.   164.
## 0.25  71.6   69.0
## 0.50  25.2   24.3
## 0.75  12.3   12.1
## 1.00   7.68   7.69
## 1.50   4.31   4.39
## 2.00   3.03   3.12
## 2.50   2.38   2.46
## 3.00   2.00   2.07
## 4.00   1.55   1.60
## 5.00   1.22   1.29



