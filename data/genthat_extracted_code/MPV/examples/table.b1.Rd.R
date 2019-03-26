library(MPV)


### Name: table.b1
### Title: Table B1
### Aliases: table.b1
### Keywords: datasets

### ** Examples

data(table.b1)
attach(table.b1)
y.lm <- lm(y ~ x2 + x7 + x8)
summary(y.lm)
# over-all F-test:
y.null <- lm(y ~ 1)
anova(y.null, y.lm)
# partial F-test for x7:
y7.lm <- lm(y ~ x2 + x8)
anova(y7.lm, y.lm)
detach(table.b1)



