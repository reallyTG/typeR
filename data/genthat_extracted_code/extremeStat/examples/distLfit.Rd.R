library(extremeStat)


### Name: distLfit
### Title: Fit distributions via L-moments
### Aliases: distLfit
### Keywords: distribution dplot hplot univar

### ** Examples


data(annMax)
# basic usage on real data (annual discharge maxima in Austria)
dlf <- distLfit(annMax)
str(dlf, max.lev=2)
printL(dlf)
plotLfit(dlf)

# arguments that can be passed to plotting function:
plotLfit(dlf, lty=2, col=3, nbest=17, legargs=list(lwd=3), main="booh!")
set.seed(42)
dlf_b <- distLfit(rbeta(100, 5, 2))
plotLfit(dlf_b, nbest=10, legargs=c(x="left"))
plotLfit(dlf_b, selection=c("gpa", "glo", "gev", "wak"))
plotLfit(dlf_b, selection=c("gpa", "glo", "gev", "wak"), order=TRUE)
plotLfit(dlf_b, distcols=c("orange",3:6), lty=1:3) # lty is recycled
plotLfit(dlf_b, cdf=TRUE)
plotLfit(dlf_b, cdf=TRUE, histargs=list(do.points=FALSE), sel="nor")


# logarithmic axes:
set.seed(1)
y <- 10^rnorm(300, mean=2, sd=0.3) # if you use 1e4, distLfit will be much slower
hist(y, breaks=20)
berryFunctions::logHist(y, col=8)
dlf <- distLfit(log10(y))
plotLfit(dlf, breaks=50)
plotLfit(dlf, breaks=50, log=TRUE)


# Goodness of fit: how well do the distributions fit the original data?
# measured by RMSE of cumulated distribution function and ?ecdf
# RMSE: root of average of ( errors squared )  ,   errors = line distances
dlf <- distLfit(annMax, ks=TRUE)
plotLfit(dlf, cdf=TRUE, sel=c("wak", "revgum"))
x <- sort(annMax)
segments(x0=x, y0=lmomco::plmomco(x, dlf$parameter$revgum), y1=ecdf(annMax)(x), col=2)
segments(x0=x, y0=lmomco::plmomco(x, dlf$parameter$wak), y1=ecdf(annMax)(x), col=4, lwd=2)
# weights by three different weighting schemes, see distLweights:
plotLweights(dlf)
plotLfit(distLfit(annMax              ), cdf=TRUE, nbest=17)$gof
plotLfit(distLfit(annMax, truncate=0.7), cdf=TRUE, nbest=17)$gof
pairs(dlf$gof[,-(2:5)]) # measures of goodness of fit are correlated quite well here.
dlf$gof

# Kolmogorov-Smirnov Tests for normal distribution return slightly different values:
library(lmomco)
ks.test(annMax, "pnorm", mean(annMax), sd(annMax) )$p.value
ks.test(annMax, "cdfnor", parnor(lmoms(annMax)))$p.value


# Fit all available distributions (30):
## Not run: 
##D # this takes a while...
##D d_all <- distLfit(annMax, speed=FALSE, progbars=TRUE) # 20 sec
##D printL(d_all)
##D plotLfit(d_all, nbest=30, distcols=grey(1:22/29), xlim=c(20,140))
##D plotLfit(d_all, nbest=30, ylim=c(0,0.04), xlim=c(20,140))
##D plotLweights(d_all)
##D d_all$gof
## End(Not run)




