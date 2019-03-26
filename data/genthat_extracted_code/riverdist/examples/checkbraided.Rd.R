library(riverdist)


### Name: checkbraided
### Title: Check for Braiding in a River Network
### Aliases: checkbraided

### ** Examples

data(Gulk)
plot(x=Gulk)
checkbraided(rivers=Gulk)

data(KilleyW)
plot(x=KilleyW)
checkbraided(rivers=KilleyW)

Kenai3.subset <- trimriver(trimto=c(22,2,70,30,15,98,96,89,52,3), rivers=Kenai3)
plot(x=Kenai3.subset)

checkbraided(startseg=1, endseg=7, rivers=Kenai3.subset)
checkbraided(startseg=1, endseg=5, rivers=Kenai3.subset)



