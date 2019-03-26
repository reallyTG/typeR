library(MPV)


### Name: table.b8
### Title: Table B8
### Aliases: table.b8
### Keywords: datasets

### ** Examples

data(table.b8)
attach(table.b8)
clathrate.lm <- lm(y ~ x1 + x2)
summary(clathrate.lm)
detach(table.b8)



