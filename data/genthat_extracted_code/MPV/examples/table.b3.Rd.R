library(MPV)


### Name: table.b3
### Title: Table B3
### Aliases: table.b3
### Keywords: datasets

### ** Examples

data(table.b3)
attach(table.b3)
y.lm <- lm(y ~ x1 + x6)
summary(y.lm)
# testing for the significance of the regression:
y.null <- lm(y ~ 1)
anova(y.null, y.lm)
# 95% CI for mean gas mileage:
predict(y.lm, newdata=data.frame(x1=275, x6=2), interval="confidence")
# 95% PI for gas mileage:
predict(y.lm, newdata=data.frame(x1=275, x6=2), interval="prediction")
detach(table.b3)



