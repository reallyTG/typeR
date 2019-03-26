library(MPV)


### Name: table.b10
### Title: Table B10
### Aliases: table.b10
### Keywords: datasets

### ** Examples

data(table.b10)
attach(table.b10)
y.lm <- lm(y ~ x1 + x2)
summary(y.lm)
detach(table.b10)



