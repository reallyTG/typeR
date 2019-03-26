library(randomizeR)


### Name: combineBias
### Title: Combined additive bias criterion
### Aliases: combineBias

### ** Examples

chronBias <- chronBias(type="linT", theta=1, method="sim")
selBias <- selBias(type="CS", eta=1, method="sim")
combineBias(selBias, chronBias)




