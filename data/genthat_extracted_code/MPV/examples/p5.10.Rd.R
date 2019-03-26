library(MPV)


### Name: p5.10
### Title: Data Set for Problem 5-10
### Aliases: p5.10
### Keywords: datasets

### ** Examples

data(p5.10)
attach(p5.10)
y.lm <- lm(ybar.i ~ x1 + x2 + x3)
plot(y.lm, which=1)
detach(p5.10)



