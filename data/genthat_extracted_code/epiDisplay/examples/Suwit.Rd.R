library(epiDisplay)


### Name: Hookworm and blood loss
### Title: Hookworm infection and blood loss: SEAJTM 1970
### Aliases: Suwit
### Keywords: datasets

### ** Examples

data(Suwit)
with(Suwit, plot(worm, bloss, type="n"))
with(Suwit, text(worm, bloss, labels=id))
abline(lm(bloss ~ worm, data=Suwit), col="red")



