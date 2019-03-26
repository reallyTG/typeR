library(GB2)


### Name: Indicators
### Title: Monetary Laeken Indicators under the GB2
### Aliases: Indicators arpt.gb2 arpr.gb2 rmpg.gb2 qsr.gb2 main.gb2
###   main2.gb2
### Keywords: distribution

### ** Examples

a <- 3.9
b <- 18873
p <- 0.97
q <- 1.03
ap <- a*p
aq <- a*q

arpt <- arpt.gb2(0.6, a, b, p, q)
arpr <- arpr.gb2(0.6, a, p, q)
rmpg <- rmpg.gb2(arpr, a, p, q)
qsr <- qsr.gb2(a, p, q)

ind1 <- main.gb2(0.6, a, b, p, q)
ind2 <- main2.gb2(0.6, a, b, ap, aq)



