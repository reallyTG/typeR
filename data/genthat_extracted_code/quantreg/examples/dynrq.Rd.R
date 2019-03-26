library(quantreg)


### Name: dynrq
### Title: Dynamic Linear Quantile Regression
### Aliases: dynrq print.dynrq print.dynrqs summary.dynrq summary.dynrqs
###   print.summary.dynrq print.summary.dynrqs time.dynrq index.dynrq
###   start.dynrq end.dynrq
### Keywords: regression

### ** Examples

###########################
## Dynamic Linear Quantile Regression Models ##
###########################

require(zoo)
## multiplicative median SARIMA(1,0,0)(1,0,0)_12 model fitted to UK seatbelt data
     data("UKDriverDeaths", package = "datasets")
     uk <- log10(UKDriverDeaths)
     dfm <- dynrq(uk ~ L(uk, 1) + L(uk, 12))
     dfm

     dfm3 <- dynrq(uk ~ L(uk, 1) + L(uk, 12),tau = 1:3/4)
     summary(dfm3)
 ## explicitly set start and end
     dfm1 <- dynrq(uk ~ L(uk, 1) + L(uk, 12), start = c(1975, 1), end = c(1982, 12))
 ## remove lag 12
     dfm0 <- update(dfm1, . ~ . - L(uk, 12))
     tuk1  <- anova(dfm0, dfm1)
 ## add seasonal term
     dfm1 <- dynrq(uk ~ 1, start = c(1975, 1), end = c(1982, 12))
     dfm2 <- dynrq(uk ~ season(uk), start = c(1975, 1), end = c(1982, 12))
     tuk2 <- anova(dfm1, dfm2)
 ## regression on multiple lags in a single L() call
     dfm3 <- dynrq(uk ~ L(uk, c(1, 11, 12)), start = c(1975, 1), end = c(1982, 12))
     anova(dfm1, dfm3)

###############################
## Time Series Decomposition ##
###############################

## airline data
data("AirPassengers", package = "datasets")
ap <- log(AirPassengers)
fm <- dynrq(ap ~ trend(ap) + season(ap), tau = 1:4/5)
sfm <- summary(fm)
plot(sfm)

## Alternative time trend specifications:
##   time(ap)                  1949 + (0, 1, ..., 143)/12
##   trend(ap)                 (1, 2, ..., 144)/12
##   trend(ap, scale = FALSE)  (1, 2, ..., 144)

###############################
## An Edgeworth (1886) Problem##
###############################
# DGP
fye <- function(n, m = 20){
    a <- rep(0,n)
    s <- sample(0:9, m, replace = TRUE)
    a[1] <- sum(s)
    for(i in 2:n){
       s[sample(1:20,1)] <- sample(0:9,1)
       a[i] <- sum(s)
    }
    zoo::zoo(a)
}
x <- fye(1000)
f <- dynrq(x ~ L(x,1))
plot(x,cex = .5, col = "red")
lines(fitted(f), col = "blue")




