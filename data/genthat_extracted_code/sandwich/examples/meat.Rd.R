library(sandwich)


### Name: meat
### Title: A Simple Meat Matrix Estimator
### Aliases: meat
### Keywords: regression

### ** Examples

x <- sin(1:10)
y <- rnorm(10)
fm <- lm(y ~ x)

meat(fm)
meatHC(fm, type = "HC")
meatHAC(fm)



