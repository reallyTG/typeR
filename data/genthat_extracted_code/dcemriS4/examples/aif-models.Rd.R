library(dcemriS4)


### Name: aif-models
### Title: Arterial Input Functions
### Aliases: aif-models aif.orton.exp model.orton.exp orton.exp.lm
### Keywords: models

### ** Examples

data("buckley")
## Generate AIF params using the orton.exp function from Buckley's AIF
xi <- seq(5, 300, by=5)
time <- buckley$time.min[xi]
aif <- buckley$input[xi]
aifparams <- orton.exp.lm(time, aif)
aifparams$D <- 1
unlist(aifparams[1:4])

aoe <- aif.orton.exp(time, aifparams$AB, aifparams$muB, aifparams$AG,
                     aifparams$muG)
with(buckley, plot(time.min, input, type="l", lwd=2))
lines(time, aoe, lwd=2, col=2)
legend("right", c("Buckley's AIF", "Our approximation"), lty=1,
       lwd=2, col=1:2)
cbind(time, aif, aoe)[1:10,]



