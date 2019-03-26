library(fracdiff)


### Name: fdSperio
### Title: Sperio Estimate for 'd' in ARFIMA(p,d,q)
### Aliases: fdSperio
### Keywords: ts

### ** Examples

memory.long <- fracdiff.sim(1500, d = 0.3)
spm <- fdSperio(memory.long$series)
str(spm, digits=6)



