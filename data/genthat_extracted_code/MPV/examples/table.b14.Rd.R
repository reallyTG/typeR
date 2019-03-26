library(MPV)


### Name: table.b14
### Title: Table B14
### Aliases: table.b14
### Keywords: datasets

### ** Examples

data(table.b14)
y.lm <- lm(y ~ x1 + x2 + x3 + x4, data=table.b14)
plot(y.lm, which=1)



