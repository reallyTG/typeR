library(lolog)


### Name: plot.lologGmm
### Title: Conduct Monte Carlo diagnostics on a lolog model fit
### Aliases: plot.lologGmm

### ** Examples

library(network)
set.seed(1)
data(flo)
flomarriage <- network(flo,directed=FALSE)
flomarriage %v% "wealth" <- c(10,36,27,146,55,44,20,8,42,103,48,49,10,48,32,3)


# An order dependent model
fit3 <- lolog(flomarriage ~ edges + nodeCov("wealth") + preferentialAttachment(),
              flomarriage ~ star(2:3), verbose=FALSE)
plot(fit3)
plot(fit3, "target")
plot(fit3, "model")



