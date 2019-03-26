library(spc)


### Name: xewma.ad
### Title: Compute steady-state ARLs of EWMA control charts
### Aliases: xewma.ad
### Keywords: ts

### ** Examples

## comparison of zero-state (= worst case ) and steady-state performance
## for two-sided EWMA control charts

l <- .1
c <- xewma.crit(l,500,sided="two")
mu <- c(0,.5,1,1.5,2)
arl <- sapply(mu,l=l,c=c,sided="two",xewma.arl)
ad <- sapply(mu,l=l,c=c,sided="two",xewma.ad)
round(cbind(mu,arl,ad),digits=2)

## Lucas/Saccucci (1990)
## two-sided EWMA

## with fixed limits
l1 <- .5
l2 <- .03
c1 <- 3.071
c2 <- 2.437
mu <- c(0,.25,.5,.75,1,1.5,2,2.5,3,3.5,4,5)
ad1 <- sapply(mu,l=l1,c=c1,sided="two",xewma.ad)
ad2 <- sapply(mu,l=l2,c=c2,sided="two",xewma.ad)
round(cbind(mu,ad1,ad2),digits=2)

## original results are (in Table 3)
## 0.00 499.   480.  
## 0.25 254.    74.1
## 0.50  88.4   28.6
## 0.75  35.7   17.3
## 1.00  17.3   12.5
## 1.50   6.44   8.00
## 2.00   3.58   5.95
## 2.50   2.47   4.78
## 3.00   1.91   4.02
## 3.50   1.58   3.49
## 4.00   1.36   3.09
## 5.00   1.10   2.55



