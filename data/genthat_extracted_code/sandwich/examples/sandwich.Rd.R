library(sandwich)


### Name: sandwich
### Title: Making Sandwiches with Bread and Meat
### Aliases: sandwich
### Keywords: regression

### ** Examples

x <- sin(1:10)
y <- rnorm(10)
fm <- lm(y ~ x)

sandwich(fm)
vcovHC(fm, type = "HC")



