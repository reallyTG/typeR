library(WhiteStripe)


### Name: get.largest.mode
### Title: Grab largest peak
### Aliases: get.largest.mode

### ** Examples

data(t2.voi.hist)
system.time({
y = t2.voi.hist$counts
x = t2.voi.hist$mids
x = x[!is.na(y)];
y = y[!is.na(y)]
# 30 used for speed of example
nawm_peak = get.largest.mode(x, y, k=30)
plot(t2.voi.hist, border="red")
abline(v=nawm_peak)
})



