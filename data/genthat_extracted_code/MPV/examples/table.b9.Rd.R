library(MPV)


### Name: table.b9
### Title: Data Set for Table B9
### Aliases: table.b9
### Keywords: datasets

### ** Examples

data(table.b9)
attach(table.b9)
# Partial Solution to Problem 3.13:
y.lm <- lm(y ~ x1 + x2 + x3 + x4)
summary(y.lm)
detach(table.b9)



