library(erer)


### Name: bsLag
### Title: Lagged Time Series
### Aliases: bsLag
### Keywords: manip

### ** Examples

# simple example
h1 <- ts(data=cbind(1:24), start=c(2001, 1), frequency=12)
h2 <- ts(data=cbind(1:24, 25:48), start=c(2001, 1), frequency=12)
h3 <- ts(data=cbind(1:4, 5:8, 9:12), start=c(2001, 1), frequency=4)
colnames(h2) <- c("aa", "bb")
colnames(h3) <- c("cc", "dd", "ee")
h1; h2; h3

bsLag(h=h1, lag=0, prefix="", suffix=".t_")
bsLag(h=h1, lag=2, prefix="price.", var.name="fl", suffix=".t_")
bsLag(h=h1, lag=2, prefix="price.", var.name="fl", suffix=".t_", by.lag=TRUE)
bsLag(h=h1, lag=23, prefix="price.", suffix=".t_", include.orig=FALSE)

bsLag(h=h2, lag=4, prefix="", suffix=".t_", include.orig = TRUE)
bsLag(h=h2, lag=4, prefix="", suffix=".t_", include.orig = FALSE)
bsLag(h=h2, lag=4, prefix="", suffix=".t_", include.orig = FALSE, by.lag=TRUE)
bsLag(h=h2, lag=0, prefix="", var.name=c("nc", "sc"), suffix=".t_")

bsLag(h=h3, lag=2, prefix="", suffix=".t_", include.orig=FALSE)
bsLag(h=h3, lag=1, prefix="", var.name=c("nd", "sd", "mi"), suffix=".lag.")
bsLag(h=h3, lag=2, prefix="NY.", suffix=".t_", by.lag=TRUE)
bsLag(h=h3, lag=3, prefix="NY.", suffix=".t_", include.orig=FALSE)

# with real data
data(daBedRaw)
small <- daBedRaw[, c("vCN", "qCN")]
(lag.small <- bsLag(h=small, lag=4))
colnames(lag.small)

resid <- residuals(lm(qCN ~ vCN, data = small))
res <- ts(resid, start=start(small), end=end(small),
    frequency=tsp(small)[3])
lag.res <- bsLag(h=res, lag=2, prefix="resid.", var.name="china")
str(lag.res)
head(lag.res)
tail(lag.res)



