library(paleoTS)


### Name: sim.punc
### Title: Simulate evolutionary time-series with changing dynamics
### Aliases: sim.punc sim.sgs sim.GRW.shift
### Keywords: models ts

### ** Examples

# illustrate differences between sampled and unsampled punctuations
x1<- sim.sgs(ms=0.4, omega=0.5)
x2<- sim.punc(ns=c(30,30), theta=c(0, mean(x1$mm[41:60])), omega=c(0.5,0.5))
layout(1:2)
plot(x1, nse=2, col="red", main="Sampled Punctuation")
rect(x1$tt[20],min(x1$mm), x1$tt[40], max(x1$mm))
text(x1$tt[30], max(x1$mm), "sampled\ntransition", font=3, pos=1, cex=0.8)
plot(x2, nse=2, col="black", main="Unsampled Punctuation")
rect(x2$tt[30],min(x2$mm),x2$tt[31],max(x2$mm))
text(x2$tt[31], mean(x2$mm), "unsampled\ntransition", font=3, pos=4, cex=0.8)



