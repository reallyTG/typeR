library(ppcc)


### Name: ppccTest
### Title: Probability Plot Correlation Coefficient Test
### Aliases: ppccTest
### Keywords: htest npar

### ** Examples

## Filliben (1975, p.116)
## Note: Filliben's result was 0.98538
## decimal accuracy in 1975 is assumed to be less than in 2017
x <- c(6, 1, -4, 8, -2, 5, 0)
set.seed(100)
ppccTest(x, "qnorm", ppos="Filliben")
## p between .75 and .9
## see Table 1 of Filliben (1975, p.113)
##
set.seed(100)
## Note: default plotting position for
## qnorm is ppos ="Blom"
ppccTest(x, "qnorm")
## p between .75 and .9
## see Table 2 of Looney and Gulledge (1985, p.78)
##
## 
set.seed(300)
x <- rnorm(30)
qn <- ppccTest(x, "qnorm")
qn
## p between .5 and .75
## see Table 2 for n = 30 of Looney and Gulledge (1985, p.78)
##
## Compare with Shapiro-Francia test
if(require(nortest)){
   sn <- sf.test(x)
   print(sn)
   W <- sn$statistic
   rr <- qn$statistic^2
   names(W) <- NULL
   names(rr) <- NULL
   print(all.equal(W, rr))
}
ppccTest(x, "qunif")
ppccTest(x, "qlnorm")
old <- par()
par(mfrow=c(1,3))
xlab <- "Theoretical Quantiles"
ylab <- "Empirical Quantiles"
qqplot(x = qnorm(ppPositions(30, "Blom")),
       y = x, xlab=xlab, ylab=ylab, main = "Normal q-q-plot")
qqplot(x = qunif(ppPositions(30, "Weibull")),
       y = x, xlab=xlab, ylab=ylab, main = "Uniform q-q-plot")
qqplot(x = qlnorm(ppPositions(30, "Blom")),
       y = x, xlab=xlab, ylab=ylab, main = "log-Normal q-q-plot")
par(old)
##
if (require(VGAM)){
set.seed(300)
x <- rgumbel(30)
gu <- ppccTest(x, "qgumbel")
print(gu)
1000 * (1 -  gu$statistic)
}
##
## see Table 2 for n = 30 of Vogel (1986, p.589) 
## for n = 30 and Si = 0.5, the critical value is 16.9 
##
set.seed(200)
x <- runif(30)
un <- ppccTest(x, "qunif")
print(un)
1000 * (1 - un$statistic)
##
## see Table 1 for n = 30 of Vogel and Kroll (1989, p.343)
## for n = 30 and Si = 0.5, the critical value is 10.5
##
set.seed(200)
x <- rweibull(30, shape = 2.5)
ppccTest(x, "qweibull", shape=2.5)
ppccTest(x, "qweibull", shape=1.5)
##
if (require(VGAM)){
set.seed(200)
x <- rgev(30, shape = -0.2)
ev <- ppccTest(x, "qgev", shape=-0.2)
print(ev)
1000 * (1 - ev$statistic)
##
## see Table 3 for n = 30 and shape = -0.2
## of Chowdhury et al. (1991, p.1770)
## The tabulated critical value is 80.
}




