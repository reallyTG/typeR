library(aods3)


### Name: gof
### Title: Test of Goodness-of-Fit of Models for Count data
### Aliases: gof gof.default print.gof
### Keywords: datagen

### ** Examples

data(orob2)
fm1 <- glm(cbind(m, n - m) ~ seed, data = orob2, family = binomial)
fm2 <- aodml(cbind(m, n - m) ~ seed, data = orob2, family = "bb")
gof(fm1)
gof(fm2)



