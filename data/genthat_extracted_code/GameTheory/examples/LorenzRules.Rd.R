library(GameTheory)


### Name: LorenzRules
### Title: Inequality plot among rules
### Aliases: LorenzRules

### ** Examples



## replication of Gallastegui et al. (2003), Table 7.

CLAIMS <- c(158,299,927,2196,4348,6256,13952)
COUNTRIES <- c("Germany","Netherlands","Belgium","Ireland","UK","Spain","France")
INARRA <- AllRules(13500,CLAIMS,COUNTRIES)
summary(INARRA)

plot(INARRA,5) ## Display allocations for UK
LorenzRules(INARRA) ## Inequality graph



