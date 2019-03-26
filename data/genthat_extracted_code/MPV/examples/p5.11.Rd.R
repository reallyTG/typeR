library(MPV)


### Name: p5.11
### Title: Data Set for Problem 5-11
### Aliases: p5.11
### Keywords: datasets

### ** Examples

data(p5.11)
attach(p5.11)
ybar.i <- apply(p5.11[,5:7], 1, mean)
sd.i <- apply(p5.11[,5:7], 1, sd)
y.lm <- lm(ybar.i ~ x1 + x2 + x3 + x4)
plot(y.lm, which=1)
detach(p5.11)



