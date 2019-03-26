library(FlowScreen)


### Name: bf_oneparam
### Title: One parameter recursive digital filter
### Aliases: bf_oneparam

### ** Examples

data(cania.sub.ts)
res <- bf_oneparam(cania.sub.ts$Flow, k=0.9)
plot(cania.sub.ts$Date, cania.sub.ts$Flow, xlab="", ylab="Q (m3/s)", type="l")
points(cania.sub.ts$Date, res, type="l", col="blue")



