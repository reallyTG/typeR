library(FlowScreen)


### Name: bf_boughton
### Title: Boughton recursive digital filter
### Aliases: bf_boughton

### ** Examples

data(cania.sub.ts)
res <- bf_boughton(cania.sub.ts$Flow, k=0.9, C=0.1)
plot(cania.sub.ts$Date, cania.sub.ts$Flow, xlab="", ylab="Q (m3/s)", type="l")
points(cania.sub.ts$Date, res, type="l", col="blue")



