library(extracat)


### Name: Burt
### Title: Burt atrix
### Aliases: Burt

### ** Examples

require(MASS)
Burt(housing)
th <- xtabs(Freq~Sat+Infl+Type, data = housing)
Burt(th)




