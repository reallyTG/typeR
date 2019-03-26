library(GB2)


### Name: Moments
### Title: Moments and Other Properties of a GB2 Random Variable
### Aliases: Moments moment.gb2 incompl.gb2 el.gb2 vl.gb2 sl.gb2 kl.gb2
### Keywords: distribution

### ** Examples

a <- 3.9
b <- 18873
p <- 0.97
q <- 1.03
k <- 2
x <- qgb2(0.6, a, b, p, q)
moment.gb2(k, a, b, p, q)
incompl.gb2(x, k, a, b, p, q)
vl.gb2(a, p, q)
kl.gb2(p, q)



