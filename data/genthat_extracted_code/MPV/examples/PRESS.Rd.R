library(MPV)


### Name: PRESS
### Title: PRESS statistic
### Aliases: PRESS
### Keywords: models

### ** Examples

data(p4.18)
attach(p4.18)
y.lm <- lm(y ~ x1 + I(x1^2))
PRESS(y.lm)
detach(p4.18)



