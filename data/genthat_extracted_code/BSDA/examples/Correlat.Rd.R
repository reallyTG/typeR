library(BSDA)


### Name: Correlat
### Title: Exercise to illustrate correlation
### Aliases: Correlat
### Keywords: datasets

### ** Examples


plot(y ~ x, data = Correlat)
model <- lm(y ~ x, data = Correlat)
abline(model)
rm(model)




