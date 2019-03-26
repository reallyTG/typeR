library(DAMisc)


### Name: testLoess
### Title: Significance Test for Loess vs. LM
### Aliases: testLoess

### ** Examples

library(car)
linmod <- lm(prestige ~ income, data=Prestige)
lomod <- loess(prestige ~ income, data=Prestige)
testLoess(linmod, lomod)



