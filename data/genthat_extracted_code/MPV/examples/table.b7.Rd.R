library(MPV)


### Name: table.b7
### Title: Data Set for Table B7
### Aliases: table.b7
### Keywords: datasets

### ** Examples

data(table.b7)
attach(table.b7)
# partial solution to Problem 3.11:
peanuts.lm <- lm(y ~ x1 + x2 + x3 + x4 + x5)
summary(peanuts.lm)
detach(table.b7)



