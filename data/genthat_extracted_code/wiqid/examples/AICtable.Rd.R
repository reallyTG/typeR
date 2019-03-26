library(wiqid)


### Name: AICtable
### Title: Make a table for AIC or other criterion
### Aliases: AICtable

### ** Examples

data(KanhaTigers)
mods <- NULL
mods$M0 <- closedCapM0(KanhaTigers)
mods$Mh2 <- closedCapMh2(KanhaTigers)
mods$MhJK <- closedCapMhJK(KanhaTigers)
mods$Mt <- closedCapMt(KanhaTigers)
AICc <- sapply(mods, AICc)
AICtable(AICc)
# MhJK does not use likelihood maximisation



