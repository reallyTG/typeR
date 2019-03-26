library(tseries)


### Name: seqplot.ts
### Title: Plot Two Time Series
### Aliases: seqplot.ts
### Keywords: hplot ts

### ** Examples

data(USeconomic)
x <- ts.union(log(M1), log(GNP), rs, rl)
m.ar <- ar(x, method = "ols", order.max = 5)
y <- predict(m.ar, x, n.ahead = 200, se.fit = FALSE)
seqplot.ts(x, y)



