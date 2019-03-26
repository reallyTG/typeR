library(lolog)


### Name: simulate.lolog
### Title: Generates BinaryNetworks from a fit lolog object
### Aliases: simulate.lolog

### ** Examples

library(network)
data(flo)
flomarriage <- network(flo,directed=FALSE)
flomarriage %v% "wealth" <- c(10,36,27,146,55,44,20,8,42,103,48,49,10,48,32,3)
fit <- lolog(flomarriage ~ edges + nodeCov("wealth"))
net <- simulate(fit)[[1]]
plot(net)




