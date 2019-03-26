library(adeba)


### Name: radeba
### Title: ADEBA estimates
### Aliases: radeba dadeba padeba

### ** Examples

data(faithful)
f <- adeba(faithful$eruptions, adaptive=FALSE)
f.eruptions <- radeba(1e5, f)
hist(f.eruptions, breaks=100, col="skyblue", probability=TRUE)
lines(f, lwd=3)
rug(faithful$eruptions)



