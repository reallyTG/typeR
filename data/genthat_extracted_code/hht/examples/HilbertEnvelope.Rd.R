library(hht)


### Name: HilbertEnvelope
### Title: Instantaneous amplitude
### Aliases: HilbertEnvelope
### Keywords: ts

### ** Examples

tt <- seq(1000) * 0.01
sig <- sin(4 * pi * tt) + sin(3.4 * pi * tt)
asig <- HilbertTransform(sig)
env <- HilbertEnvelope(asig)
plot(tt, sig, type = "l")
lines(tt, env, col = "red")
lines(tt, -env, col = "red")




