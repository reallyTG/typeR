library(MPV)


### Name: table.b6
### Title: Data Set for Table B6
### Aliases: table.b6
### Keywords: datasets

### ** Examples

data(table.b6)
# Partial Solution to Problem 3.9
attach(table.b6)
y.lm <- lm(y ~ x1 + x4)
summary(y.lm)
detach(table.b6)



