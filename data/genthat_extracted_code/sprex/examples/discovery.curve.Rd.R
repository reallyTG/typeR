library(sprex)


### Name: discovery.curve
### Title: Discovery Curve
### Aliases: discovery.curve

### ** Examples

data(osa.old.growth)
f <- expand.freqs(osa.old.growth)
d <- discovery.curve(f, f0.func = Chao1, max.x = 1200)
plot(d)




