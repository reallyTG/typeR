library(MPV)


### Name: quadline
### Title: Quadratic Overlay
### Aliases: quadline
### Keywords: models

### ** Examples

data(p4.18)
attach(p4.18)
y.lm <- lm(y ~ x1 + I(x1^2))
plot(x1, y)
quadline(y.lm)
detach(p4.18)



