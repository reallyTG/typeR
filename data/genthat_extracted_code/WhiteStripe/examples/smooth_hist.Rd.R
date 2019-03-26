library(WhiteStripe)


### Name: smooth_hist
### Title: Histogram smoothing for whitestripe
### Aliases: smooth_hist

### ** Examples

data(t2.voi.hist)
y = t2.voi.hist$counts
x = t2.voi.hist$mids
x = x[!is.na(y)];
y = y[!is.na(y)]
# 30 used for speed of example
s.hist = smooth_hist(x, y, k=30)
plot(t2.voi.hist, border="red")
lines(s.hist)



