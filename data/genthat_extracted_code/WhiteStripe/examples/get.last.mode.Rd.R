library(WhiteStripe)


### Name: get.last.mode
### Title: Get Last Peak
### Aliases: get.last.mode

### ** Examples

data(t1.voi.hist)
system.time({
y = t1.voi.hist$counts
x = t1.voi.hist$mids
x = x[!is.na(y)];
y = y[!is.na(y)]
# 20 used for speed of example
nawm_peak = get.last.mode(x, y, k=20)
plot(t1.voi.hist, border="red")
abline(v=nawm_peak)
})
 



