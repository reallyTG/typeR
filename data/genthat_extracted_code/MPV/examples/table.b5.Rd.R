library(MPV)


### Name: table.b5
### Title: Data Set for Table B5
### Aliases: table.b5
### Keywords: datasets

### ** Examples

data(table.b5)
attach(table.b5)
y.lm <- lm(y ~ x6 + x7)
summary(y.lm)
detach(table.b5)



