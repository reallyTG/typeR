library(Rcapture)


### Name: closedp
### Title: Loglinear Models for Closed Population Capture-Recapture
###   Experiments
### Aliases: closedp closedp.t closedp.0 print.closedp boxplot.closedp
###   plot.closedp
### Keywords: models

### ** Examples

data(hare)
hare.closedp <- closedp.t(hare)
hare.closedp
boxplot(hare.closedp)

data(mvole)
period3 <- mvole[, 11:15]
closedp.t(period3)

data(BBS2001)
BBS.closedp <- closedp.0(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20)
BBS.closedp
plot(BBS.closedp)

### Seber (1982) p.107
# When there is 2 capture occasions, the heterogeneity models cannot be fitted
X <- matrix(c(1,1,167,1,0,781,0,1,254), byrow = TRUE, ncol = 3)
closedp.t(X, dfreq = TRUE)

### Example of captures in continuous time
### Illegal immigrants data
data(ill)
closedp.0(ill, dtype = "nbcap", dfreq = TRUE, t = Inf)



