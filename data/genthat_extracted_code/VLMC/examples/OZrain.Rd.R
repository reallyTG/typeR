library(VLMC)


### Name: OZrain
### Title: Daily Rainfall in Melbourne, Australia, 1981-1990
### Aliases: OZrain
### Keywords: datasets

### ** Examples

data(OZrain)
(n <- length(OZrain)) ## should be 1 more than
ISOdate(1990,12,31) - ISOdate(1981, 1,1)## but it's 2 ..

has.rain <- OZrain > 0

summary(OZrain[has.rain])# Median = 18,  Q3 = 50
table(rain01 <- as.integer(has.rain))
table(rain4c <- cut(OZrain, c(-.1, 0.5, 18.5, 50.1, 1000)))

## Don't show: 
  table(rain4c <- as.integer(rain4c) - 1:1)
  draw(v4 <- vlmc(rain4c))
  v4 # cutoff 3.907; MC = 9, context = 39
  vlmc(rain4c, cut = 0  )$size # MC = 25; context = 2355, #{leaves}= 1062
  vlmc(rain4c, cut = 0.1)$size # MC = 25; context = 2344
  vlmc(rain4c, cut = 0.3)$size # MC = 25; context = 1990, #{leaves}=  967
  vlmc(rain4c, cut = 6.0)$size # MC =  7; context =   10, #{leaves}=    4
  lLv <- function(co) {
    l <- logLik(vlmc(rain4c, cut = co)); c(Ll = l, df = attr(l,"df"))
  }
  cuts4 <- c(0,0.1,0.3,0.5,0.7, seq(1,7, by = .25), 9, 12,13)
  ll4 <- sapply(cuts4, lLv)
  par(mfcol = c(2,2))
  plot(cuts4, AIC4 <- c(c(-2,2) %*% ll4), type = 'b')
  plot(cuts4, BIC4 <- c(c(-2,log(n)) %*% ll4), type = 'b')
  ii <- cuts4 > 2.
  plot(cuts4[ii], AIC4[ii], type = 'b')
  plot(cuts4[ii], BIC4[ii], type = 'b')
## End(Don't show)

AIC(v1  <- vlmc(rain01))# cutoff = 1.92
AIC(v00 <- vlmc(rain01, cut = 1.4))
AIC(v0  <- vlmc(rain01, cut = 1.5))

## Don't show: 
  lLv <- function(co) {
    cat(co,"")
    l <- logLik(vlmc(rain01, cut = co))
    c(Ll = l, df = attr(l,"df"))
  }
  cc <- seq(1., 3, len = 401)
  system.time(vll <- sapply(cc, lLv))# 21 & 49 sec. (on P III 900 MHz)
  llv <- vll["Ll",] ; dfv <- vll["df",]
  par(mfrow=c(2,2))
  ## very interesting:  quite a few local minima!!
  plot  (cc, -2*llv + 2*dfv, type='l', main="AIC(vlmc(rain01, cutoff = cc))")
  plot  (cc, dfv, type='l', main="Complexity(vlmc(*, cutoff = cc))")
  plot  (cc, llv, type='l', main="Log.Likelihood(vlmc(*, cutoff = cc))")

  ## BIC is all falling:
  ##  par(new=T)
  plot  (cc, -2*llv + log(3653)*dfv, type='l', main="BIC(vlmc(*, cutoff = cc))")
## End(Don't show)

hist(OZrain)
hist(OZrain, breaks = c(0,1,5,10,50,1000), xlim = c(0,100))

plot(OZrain, main = "Rainfall 1981-1990 in Melbourne")
plot(OZrain, log="y", main = "Non-0 Rainfall [LOG scale]")

lOZ <- lowess(log10(OZrain[has.rain]), f= .05)
lines(time(OZrain)[has.rain], 10^lOZ$y, col = 2, lwd = 2)



