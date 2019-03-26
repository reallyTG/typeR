library(MPV)


### Name: table.b4
### Title: Table B4
### Aliases: table.b4
### Keywords: datasets

### ** Examples

data(table.b4)
attach(table.b4)
y.lm <- lm(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9)
summary(y.lm)
detach(table.b4)



