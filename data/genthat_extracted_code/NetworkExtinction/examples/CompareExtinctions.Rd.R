library(NetworkExtinction)


### Name: CompareExtinctions
### Title: Comparison of Null hypothesis with other extinction histories
### Aliases: CompareExtinctions

### ** Examples

data("net")
History <- Mostconnected(Network = net)

NullHyp <- RandomExtinctions(Network = net, nsim = 100)

CompareExtinctions(Nullmodel = NullHyp, Hypothesis = History)



