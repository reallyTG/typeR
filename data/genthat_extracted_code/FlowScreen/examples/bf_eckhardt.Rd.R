library(FlowScreen)


### Name: bf_eckhardt
### Title: Eckhardt two parameter recursive digital filter
### Aliases: bf_eckhardt

### ** Examples

data(cania.sub.ts)
bf <- bf_eckhardt(cania.sub.ts$Flow, 0.97, 0.8)
plot(cania.sub.ts$Date, cania.sub.ts$Flow, type="l")
points(cania.sub.ts$Date, bf, type="l", col="blue")



