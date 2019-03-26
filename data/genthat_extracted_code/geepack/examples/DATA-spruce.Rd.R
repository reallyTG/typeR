library(geepack)


### Name: spruce
### Title: Log-size of 79 Sitka spruce trees
### Aliases: spruce
### Keywords: datasets

### ** Examples

data(spruce)
spruce$contr <- ifelse(spruce$ozone=="enriched", 0, 1)
sitka88 <- spruce[spruce$wave <= 5,]
sitka89 <- spruce[spruce$wave > 5,]
fit.88 <- geese(logsize ~ as.factor(wave) + contr +
                          I(time/100*contr) - 1,
                id=id, data=sitka88, corstr="ar1")
summary(fit.88)

fit.89 <- geese(logsize ~ as.factor(wave) + contr - 1,
                id=id, data=sitka89, corstr="ar1")
summary(fit.89)



