library(desire)


### Name: ddesire
### Title: Generic Distribution functions for desirabilities
### Aliases: ddesire ddesire.default pdesire pdesire.default qdesire
###   qdesire.default rdesire rdesire.default edesire edesire.default
###   vdesire vdesire.default
### Keywords: distribution

### ** Examples

data(Chocolate)

## Fit linear model to data:
m.d90 <- lm(d90 ~ rt + as + I(rt^2) + I(as^2) + rt:as, Chocolate)
m.Fe <- lm(Fe ~ rt + as + I(rt^2) + I(as^2) + rt:as, Chocolate)

## Define desirability functions:
d.d90 <- harrington2(21, 22, 1)
d.Fe <- harrington1(22, 0.8, 28, 0.2)

## Plot density of desirability in rt=30, as=50:
df <- data.frame(rt=30, as=50)
y.Fe <- predict(m.Fe, df)
sigma.Fe <- summary(m.Fe)$sigma

y.d90 <- predict(m.d90, df)
sigma.d90 <- summary(m.d90)$sigma

## Plot curve of density function:
opar <- par(mfrow=c(2,1))
curve(ddesire(x, d.d90, y.d90, sigma.d90), 0, 1, main="d.90", n=202)
curve(ddesire(x, d.Fe, y.Fe, sigma.Fe), 0, 1, main="Fe", n=202)
par(opar)

## Integrate:
integrate(function(x) ddesire(x, d.d90, y.d90, sigma.d90), 0, 1)
integrate(function(x) ddesire(x, d.Fe, y.Fe, sigma.Fe), 0, 1)



