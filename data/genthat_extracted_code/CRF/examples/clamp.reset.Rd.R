library(CRF)


### Name: clamp.reset
### Title: Reset clamped CRF
### Aliases: clamp.reset

### ** Examples


library(CRF)
data(Small)
crf <- clamp.crf(Small$crf, c(0, 0, 1, 1))
clamp.reset(crf, c(0,0,2,2))





