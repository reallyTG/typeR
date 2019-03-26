library(FlowScreen)


### Name: pks.dur
### Title: Calculate the inter-event duration
### Aliases: pks.dur

### ** Examples

data(cania.sub.ts)
res1 <- pks(cania.sub.ts)
res2 <- pks.dur(res1)
res3 <- screen.metric(res2, "Inter-Event Duration (days)")



