library(skyscapeR)


### Name: curvigram
### Title: Computes declination curvigram
### Aliases: curvigram

### ** Examples

# Curvigram of Ruggles' Recumbent Stone Circle data:
data(RugglesRSC)
curv <- curvigram(RugglesRSC$Dec, 2)
plotCurv(curv)



