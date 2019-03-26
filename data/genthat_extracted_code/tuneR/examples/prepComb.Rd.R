library(tuneR)


### Name: prepComb
### Title: Preparing the combination/concatenation of Wave or WaveMC
###   objects
### Aliases: prepComb
### Keywords: manip utilities

### ** Examples

Wobj1 <- sine(440, duration = 520)
Wobj2 <- extractWave(sine(330, duration = 500), from = 110, to = 500)
par(mfrow = c(2,1))
plot(bind(Wobj1, Wobj2), xunit = "samples")
abline(v = 520, col = "red")  # here is a "click"!

# now remove the "click" by deleting a minimal amount of information:
Wobj1 <- prepComb(Wobj1, where = "end")
Wobj2 <- prepComb(Wobj2, where = "start")
plot(bind(Wobj1, Wobj2), xunit = "samples")



